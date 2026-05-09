; DESCRIPTION: Composite: Places a cyan line segment connecting (168, 235) to (400, 60) then Renders a purple disk with center (340, 67) and radius 30.
; PLAN: r0=168(x1), r1=235(y1), r2=400(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=67(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 168
LDI r1, 235
LDI r2, 400
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 67
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
