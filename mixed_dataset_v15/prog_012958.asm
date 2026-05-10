; DESCRIPTION: Composite: Renders a white line between points (88, 69) and (321, 47) then Renders a yellow box of size 17x21 starting at (198, 198).
; PLAN: r0=88(x1), r1=69(y1), r2=321(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=198(y), r7=17(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 69
LDI r2, 321
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 198
LDI r7, 17
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
