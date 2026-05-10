; DESCRIPTION: Composite: Places a orange dot at position (358, 38) then Places a blue 106x64 rectangle at position (81, 72).
; PLAN: r0=358(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=72(y), r7=106(width), r8=64(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 81
LDI r6, 72
LDI r7, 106
LDI r8, 64
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
