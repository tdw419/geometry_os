; DESCRIPTION: Composite: Renders a black line between points (50, 214) and (261, 188) then Creates a white rectangular region at (76, 171) spanning 100 by 18 pixels.
; PLAN: r0=50(x1), r1=214(y1), r2=261(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=171(y), r7=100(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 214
LDI r2, 261
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 171
LDI r7, 100
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
