; DESCRIPTION: Composite: Renders a white line between points (164, 113) and (132, 188) then Places a yellow 77x66 rectangle at position (306, 178).
; PLAN: r0=164(x1), r1=113(y1), r2=132(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=178(y), r7=77(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 113
LDI r2, 132
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 178
LDI r7, 77
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
