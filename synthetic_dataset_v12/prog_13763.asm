; DESCRIPTION: Composite: Places a cyan 40x73 rectangle at position (136, 100) then Draws a black line from (461, 92) to (377, 145).
; PLAN: r0=136(x), r1=100(y), r2=40(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x1), r6=92(y1), r7=377(x2), r8=145(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 100
LDI r2, 40
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 92
LDI r7, 377
LDI r8, 145
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
