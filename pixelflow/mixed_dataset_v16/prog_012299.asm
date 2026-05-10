; DESCRIPTION: Composite: Renders a cyan line between points (406, 134) and (74, 253) then Places a purple dot at position (373, 142) then Creates a magenta rectangular region at (160, 79) spanning 23 by 83 pixels.
; PLAN: r0=406(x1), r1=134(y1), r2=74(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=142(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=79(y), r12=23(width), r13=83(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 134
LDI r2, 74
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 142
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 160
LDI r11, 79
LDI r12, 23
LDI r13, 83
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
