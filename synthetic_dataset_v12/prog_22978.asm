; DESCRIPTION: Composite: Creates a orange rectangular region at (291, 91) spanning 33 by 57 pixels then Places a purple line segment connecting (503, 152) to (275, 51).
; PLAN: r0=291(x), r1=91(y), r2=33(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x1), r6=152(y1), r7=275(x2), r8=51(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 91
LDI r2, 33
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 152
LDI r7, 275
LDI r8, 51
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
