; DESCRIPTION: Composite: Draws a orange line from (311, 112) to (443, 124) then Renders a cyan disk with center (320, 126) and radius 70.
; PLAN: r0=311(x1), r1=112(y1), r2=443(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=126(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 311
LDI r1, 112
LDI r2, 443
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 126
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
