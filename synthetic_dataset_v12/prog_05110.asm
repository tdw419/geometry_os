; DESCRIPTION: Composite: Draws a blue circle centered at (363, 152) with radius 69 then Places a green line segment connecting (410, 146) to (457, 249).
; PLAN: r0=363(x), r1=152(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x1), r6=146(y1), r7=457(x2), r8=249(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 152
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 146
LDI r7, 457
LDI r8, 249
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
