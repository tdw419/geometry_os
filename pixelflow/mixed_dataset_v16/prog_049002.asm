; DESCRIPTION: Composite: Places a yellow 116x22 rectangle at position (108, 179) then Places a black line segment connecting (342, 184) to (102, 188).
; PLAN: r0=108(x), r1=179(y), r2=116(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=184(y1), r7=102(x2), r8=188(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 179
LDI r2, 116
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 184
LDI r7, 102
LDI r8, 188
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
