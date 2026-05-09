; DESCRIPTION: Composite: Renders a white box of size 95x112 starting at (170, 121) then Draws a green line from (76, 237) to (441, 159).
; PLAN: r0=170(x), r1=121(y), r2=95(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=237(y1), r7=441(x2), r8=159(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 121
LDI r2, 95
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 237
LDI r7, 441
LDI r8, 159
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
