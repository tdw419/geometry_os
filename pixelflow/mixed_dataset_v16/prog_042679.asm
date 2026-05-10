; DESCRIPTION: Composite: Renders a white disk with center (422, 117) and radius 38 then Renders a yellow box of size 106x75 starting at (131, 36).
; PLAN: r0=422(x), r1=117(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=36(y), r7=106(width), r8=75(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 117
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 36
LDI r7, 106
LDI r8, 75
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
