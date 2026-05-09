; DESCRIPTION: Composite: Renders a cyan disk with center (248, 123) and radius 49 then Draws a magenta line from (499, 154) to (466, 174) then Places a purple dot at position (374, 60).
; PLAN: r0=248(x), r1=123(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x1), r6=154(y1), r7=466(x2), r8=174(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=60(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 123
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 154
LDI r7, 466
LDI r8, 174
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 60
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
