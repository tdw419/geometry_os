; DESCRIPTION: Composite: Draws a blue line from (194, 66) to (227, 64) then Places a orange 114x42 rectangle at position (192, 182).
; PLAN: r0=194(x1), r1=66(y1), r2=227(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=182(y), r7=114(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 66
LDI r2, 227
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 182
LDI r7, 114
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
