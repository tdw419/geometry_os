; DESCRIPTION: Composite: Renders a magenta line between points (506, 253) and (252, 176) then Renders a cyan box of size 118x84 starting at (66, 152).
; PLAN: r0=506(x1), r1=253(y1), r2=252(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=152(y), r7=118(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 506
LDI r1, 253
LDI r2, 252
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 152
LDI r7, 118
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
