; DESCRIPTION: Composite: Places a yellow line segment connecting (311, 116) to (273, 249) then Renders a orange box of size 119x47 starting at (46, 197).
; PLAN: r0=311(x1), r1=116(y1), r2=273(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=197(y), r7=119(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 116
LDI r2, 273
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 197
LDI r7, 119
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
