; DESCRIPTION: Composite: Renders a red box of size 102x33 starting at (224, 162) then Renders a black line between points (422, 132) and (269, 10).
; PLAN: r0=224(x), r1=162(y), r2=102(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=132(y1), r7=269(x2), r8=10(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 162
LDI r2, 102
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 132
LDI r7, 269
LDI r8, 10
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
