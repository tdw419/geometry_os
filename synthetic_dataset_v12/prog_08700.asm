; DESCRIPTION: Composite: Renders a orange line between points (184, 32) and (281, 174) then Renders a white box of size 13x68 starting at (191, 169).
; PLAN: r0=184(x1), r1=32(y1), r2=281(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=169(y), r7=13(width), r8=68(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 32
LDI r2, 281
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 169
LDI r7, 13
LDI r8, 68
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
