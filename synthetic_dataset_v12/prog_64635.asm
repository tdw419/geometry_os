; DESCRIPTION: Composite: Draws a cyan line from (60, 144) to (471, 198) then Draws a orange rectangle at (129, 128) with width 28 and height 102.
; PLAN: r0=60(x1), r1=144(y1), r2=471(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=128(y), r7=28(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 144
LDI r2, 471
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 128
LDI r7, 28
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
