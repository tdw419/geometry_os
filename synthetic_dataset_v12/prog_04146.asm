; DESCRIPTION: Composite: Places a magenta 60x30 rectangle at position (54, 97) then Places a cyan circle of radius 51 at center (453, 145).
; PLAN: r0=54(x), r1=97(y), r2=60(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=145(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 97
LDI r2, 60
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 145
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
