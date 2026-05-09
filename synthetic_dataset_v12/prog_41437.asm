; DESCRIPTION: Composite: Draws a black line from (236, 237) to (412, 200) then Draws a orange rectangle at (183, 152) with width 52 and height 95.
; PLAN: r0=236(x1), r1=237(y1), r2=412(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=152(y), r7=52(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 237
LDI r2, 412
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 152
LDI r7, 52
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
