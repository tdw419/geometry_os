; DESCRIPTION: Composite: Places a blue 36x99 rectangle at position (269, 87) then Renders a black line between points (234, 51) and (118, 198).
; PLAN: r0=269(x), r1=87(y), r2=36(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x1), r6=51(y1), r7=118(x2), r8=198(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 87
LDI r2, 36
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 51
LDI r7, 118
LDI r8, 198
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
