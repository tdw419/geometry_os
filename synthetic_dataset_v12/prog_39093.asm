; DESCRIPTION: Composite: Sets a single cyan pixel at (92, 144) then Renders a green disk with center (451, 86) and radius 26 then Draws a cyan line from (173, 90) to (150, 78).
; PLAN: r0=92(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=451(x), r6=86(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x1), r11=90(y1), r12=150(x2), r13=78(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 451
LDI r6, 86
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 90
LDI r12, 150
LDI r13, 78
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
