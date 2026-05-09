; DESCRIPTION: Composite: Renders a orange line between points (247, 124) and (73, 200) then Renders a green box of size 58x91 starting at (422, 19).
; PLAN: r0=247(x1), r1=124(y1), r2=73(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=19(y), r7=58(width), r8=91(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 124
LDI r2, 73
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 19
LDI r7, 58
LDI r8, 91
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
