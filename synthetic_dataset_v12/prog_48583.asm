; DESCRIPTION: Composite: Places a yellow dot at position (495, 72) then Renders a blue disk with center (243, 98) and radius 27 then Draws a cyan line from (128, 181) to (368, 122).
; PLAN: r0=495(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=98(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=128(x1), r11=181(y1), r12=368(x2), r13=122(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 72
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 243
LDI r6, 98
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 128
LDI r11, 181
LDI r12, 368
LDI r13, 122
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
