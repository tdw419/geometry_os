; DESCRIPTION: Composite: Places a blue 32x94 rectangle at position (292, 158) then Renders a black line between points (91, 51) and (460, 152).
; PLAN: r0=292(x), r1=158(y), r2=32(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x1), r6=51(y1), r7=460(x2), r8=152(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 158
LDI r2, 32
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 51
LDI r7, 460
LDI r8, 152
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
