; DESCRIPTION: Composite: Creates a green circular shape at (224, 112) with radius 34 then Places a green line segment connecting (329, 60) to (392, 171).
; PLAN: r0=224(x), r1=112(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=60(y1), r7=392(x2), r8=171(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 112
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 60
LDI r7, 392
LDI r8, 171
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
