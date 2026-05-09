; DESCRIPTION: Composite: Renders a black line between points (407, 113) and (300, 209) then Creates a orange rectangular region at (96, 112) spanning 77 by 100 pixels.
; PLAN: r0=407(x1), r1=113(y1), r2=300(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=112(y), r7=77(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 113
LDI r2, 300
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 112
LDI r7, 77
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
