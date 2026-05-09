; DESCRIPTION: Composite: Draws a green rectangle at (103, 149) with width 102 and height 100 then Draws a purple line from (511, 71) to (354, 223).
; PLAN: r0=103(x), r1=149(y), r2=102(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x1), r6=71(y1), r7=354(x2), r8=223(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 149
LDI r2, 102
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 71
LDI r7, 354
LDI r8, 223
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
