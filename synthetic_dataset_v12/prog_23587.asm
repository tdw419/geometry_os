; DESCRIPTION: Composite: Draws a white rectangle at (231, 197) with width 83 and height 55 then Places a magenta line segment connecting (238, 156) to (328, 39).
; PLAN: r0=231(x), r1=197(y), r2=83(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=156(y1), r7=328(x2), r8=39(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 197
LDI r2, 83
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 156
LDI r7, 328
LDI r8, 39
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
