; DESCRIPTION: Composite: Renders a orange disk with center (386, 102) and radius 74 then Draws a green line from (245, 184) to (420, 50) then Sets a single white pixel at (252, 206).
; PLAN: r0=386(x), r1=102(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x1), r6=184(y1), r7=420(x2), r8=50(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=206(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 386
LDI r1, 102
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 184
LDI r7, 420
LDI r8, 50
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 206
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
