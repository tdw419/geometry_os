; DESCRIPTION: Composite: Draws a green line from (388, 253) to (385, 168) then Creates a orange rectangular region at (142, 81) spanning 25 by 23 pixels then Places a magenta dot at position (280, 219).
; PLAN: r0=388(x1), r1=253(y1), r2=385(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=81(y), r7=25(width), r8=23(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x), r11=219(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 253
LDI r2, 385
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 81
LDI r7, 25
LDI r8, 23
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 219
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
