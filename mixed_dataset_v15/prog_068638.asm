; DESCRIPTION: Composite: Renders a blue box of size 17x120 starting at (50, 117) then Renders a blue line between points (58, 58) and (189, 50).
; PLAN: r0=50(x), r1=117(y), r2=17(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x1), r6=58(y1), r7=189(x2), r8=50(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 117
LDI r2, 17
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 58
LDI r7, 189
LDI r8, 50
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
