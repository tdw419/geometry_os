; DESCRIPTION: Composite: Renders a black box of size 52x83 starting at (137, 157) then Draws a yellow line from (379, 128) to (161, 1).
; PLAN: r0=137(x), r1=157(y), r2=52(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x1), r6=128(y1), r7=161(x2), r8=1(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 157
LDI r2, 52
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 128
LDI r7, 161
LDI r8, 1
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
