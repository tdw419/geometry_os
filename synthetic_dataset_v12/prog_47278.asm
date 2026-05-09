; DESCRIPTION: Composite: Renders a yellow disk with center (241, 237) and radius 15 then Draws a cyan line from (127, 250) to (145, 103) then Creates a magenta rectangular region at (367, 208) spanning 36 by 19 pixels.
; PLAN: r0=241(x), r1=237(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x1), r6=250(y1), r7=145(x2), r8=103(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=208(y), r12=36(width), r13=19(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 237
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 250
LDI r7, 145
LDI r8, 103
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 208
LDI r12, 36
LDI r13, 19
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
