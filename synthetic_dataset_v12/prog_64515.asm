; DESCRIPTION: Composite: Places a yellow dot at position (433, 28) then Creates a black rectangular region at (412, 16) spanning 73 by 68 pixels then Draws a magenta line from (471, 54) to (40, 253).
; PLAN: r0=433(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=16(y), r7=73(width), r8=68(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=471(x1), r11=54(y1), r12=40(x2), r13=253(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 28
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 412
LDI r6, 16
LDI r7, 73
LDI r8, 68
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 54
LDI r12, 40
LDI r13, 253
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
