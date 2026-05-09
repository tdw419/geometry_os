; DESCRIPTION: Composite: Sets a single magenta pixel at (28, 111) then Renders a black line between points (431, 186) and (444, 163) then Renders a orange box of size 64x87 starting at (367, 44).
; PLAN: r0=28(x), r1=111(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=431(x1), r6=186(y1), r7=444(x2), r8=163(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=44(y), r12=64(width), r13=87(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 111
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 186
LDI r7, 444
LDI r8, 163
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 44
LDI r12, 64
LDI r13, 87
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
