; DESCRIPTION: Composite: Renders a green disk with center (443, 233) and radius 15 then Draws a white line from (353, 188) to (380, 237).
; PLAN: r0=443(x), r1=233(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x1), r6=188(y1), r7=380(x2), r8=237(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 233
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 188
LDI r7, 380
LDI r8, 237
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
