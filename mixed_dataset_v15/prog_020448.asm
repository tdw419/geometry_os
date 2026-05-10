; DESCRIPTION: Composite: Renders a cyan line between points (108, 157) and (44, 85) then Sets a single green pixel at (363, 27) then Places a cyan circle of radius 68 at center (420, 138).
; PLAN: r0=108(x1), r1=157(y1), r2=44(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=27(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=138(y), r12=68(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 157
LDI r2, 44
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 27
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 420
LDI r11, 138
LDI r12, 68
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
