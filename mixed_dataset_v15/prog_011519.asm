; DESCRIPTION: Composite: Places a blue 71x99 rectangle at position (176, 51) then Sets a single white pixel at (245, 148) then Renders a red line between points (273, 144) and (438, 228).
; PLAN: r0=176(x), r1=51(y), r2=71(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=148(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=273(x1), r11=144(y1), r12=438(x2), r13=228(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 51
LDI r2, 71
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 148
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 273
LDI r11, 144
LDI r12, 438
LDI r13, 228
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
