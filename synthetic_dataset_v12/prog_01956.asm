; DESCRIPTION: Composite: Creates a black circular shape at (470, 96) with radius 21 then Places a cyan line segment connecting (485, 71) to (489, 46).
; PLAN: r0=470(x), r1=96(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x1), r6=71(y1), r7=489(x2), r8=46(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 96
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 71
LDI r7, 489
LDI r8, 46
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
