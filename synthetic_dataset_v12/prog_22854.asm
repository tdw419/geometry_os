; DESCRIPTION: Composite: Draws a black rectangle at (82, 123) with width 120 and height 97 then Renders a purple line between points (397, 227) and (197, 156).
; PLAN: r0=82(x), r1=123(y), r2=120(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x1), r6=227(y1), r7=197(x2), r8=156(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 123
LDI r2, 120
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 227
LDI r7, 197
LDI r8, 156
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
