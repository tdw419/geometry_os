; DESCRIPTION: Composite: Renders a white box of size 106x45 starting at (22, 34) then Places a yellow line segment connecting (340, 235) to (183, 125).
; PLAN: r0=22(x), r1=34(y), r2=106(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x1), r6=235(y1), r7=183(x2), r8=125(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 34
LDI r2, 106
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 235
LDI r7, 183
LDI r8, 125
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
