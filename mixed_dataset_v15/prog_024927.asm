; DESCRIPTION: Composite: Places a magenta dot at position (375, 234) then Places a cyan 57x117 rectangle at position (163, 18).
; PLAN: r0=375(x), r1=234(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=18(y), r7=57(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 234
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 163
LDI r6, 18
LDI r7, 57
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
