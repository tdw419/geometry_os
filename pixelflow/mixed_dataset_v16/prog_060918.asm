; DESCRIPTION: Composite: Renders a purple box of size 68x15 starting at (419, 58) then Draws a white line from (119, 243) to (330, 196).
; PLAN: r0=419(x), r1=58(y), r2=68(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x1), r6=243(y1), r7=330(x2), r8=196(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 58
LDI r2, 68
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 243
LDI r7, 330
LDI r8, 196
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
