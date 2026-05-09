; DESCRIPTION: Composite: Renders a magenta line between points (145, 251) and (41, 252) then Renders a white box of size 59x107 starting at (202, 36).
; PLAN: r0=145(x1), r1=251(y1), r2=41(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=36(y), r7=59(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 251
LDI r2, 41
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 36
LDI r7, 59
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
