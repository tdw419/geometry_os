; DESCRIPTION: Composite: Draws a yellow line from (426, 172) to (249, 228) then Renders a green box of size 83x16 starting at (106, 178).
; PLAN: r0=426(x1), r1=172(y1), r2=249(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=178(y), r7=83(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 172
LDI r2, 249
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 178
LDI r7, 83
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
