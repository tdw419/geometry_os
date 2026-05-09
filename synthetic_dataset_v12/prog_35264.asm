; DESCRIPTION: Composite: Places a orange 50x105 rectangle at position (204, 95) then Places a black line segment connecting (105, 191) to (169, 103).
; PLAN: r0=204(x), r1=95(y), r2=50(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x1), r6=191(y1), r7=169(x2), r8=103(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 95
LDI r2, 50
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 191
LDI r7, 169
LDI r8, 103
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
