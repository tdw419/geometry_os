; DESCRIPTION: Composite: Places a orange dot at position (393, 108) then Places a blue 92x64 rectangle at position (291, 33).
; PLAN: r0=393(x), r1=108(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=33(y), r7=92(width), r8=64(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 108
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 291
LDI r6, 33
LDI r7, 92
LDI r8, 64
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
