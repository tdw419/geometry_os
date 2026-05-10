; DESCRIPTION: Composite: Places a blue 55x74 rectangle at position (79, 38) then Draws a black line from (200, 226) to (466, 238).
; PLAN: r0=79(x), r1=38(y), r2=55(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=226(y1), r7=466(x2), r8=238(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 38
LDI r2, 55
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 226
LDI r7, 466
LDI r8, 238
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
