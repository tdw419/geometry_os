; DESCRIPTION: Composite: Draws a yellow rectangle at (389, 26) with width 49 and height 79 then Renders a white line between points (213, 38) and (308, 134).
; PLAN: r0=389(x), r1=26(y), r2=49(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=38(y1), r7=308(x2), r8=134(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 26
LDI r2, 49
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 38
LDI r7, 308
LDI r8, 134
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
