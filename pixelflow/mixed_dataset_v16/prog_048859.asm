; DESCRIPTION: Composite: Renders a red disk with center (256, 85) and radius 12 then Draws a white line from (239, 113) to (46, 121) then Sets a single green pixel at (234, 234).
; PLAN: r0=256(x), r1=85(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x1), r6=113(y1), r7=46(x2), r8=121(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=234(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 85
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 113
LDI r7, 46
LDI r8, 121
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 234
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
