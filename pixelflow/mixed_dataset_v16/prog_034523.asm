; DESCRIPTION: Composite: Renders a cyan disk with center (348, 117) and radius 65 then Sets a single white pixel at (82, 222) then Places a cyan line segment connecting (327, 181) to (108, 99).
; PLAN: r0=348(x), r1=117(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=222(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=327(x1), r11=181(y1), r12=108(x2), r13=99(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 117
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 222
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 327
LDI r11, 181
LDI r12, 108
LDI r13, 99
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
