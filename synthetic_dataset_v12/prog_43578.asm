; DESCRIPTION: Composite: Draws a cyan line from (255, 226) to (79, 121) then Places a magenta dot at position (37, 145) then Places a magenta circle of radius 63 at center (409, 184).
; PLAN: r0=255(x1), r1=226(y1), r2=79(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=145(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=409(x), r11=184(y), r12=63(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 226
LDI r2, 79
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 145
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 409
LDI r11, 184
LDI r12, 63
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
