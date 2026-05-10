; DESCRIPTION: Composite: Renders a cyan disk with center (97, 144) and radius 79 then Renders a purple box of size 114x59 starting at (324, 2) then Sets a single purple pixel at (381, 107).
; PLAN: r0=97(x), r1=144(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x), r6=2(y), r7=114(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=381(x), r11=107(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 144
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 2
LDI r7, 114
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 107
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
