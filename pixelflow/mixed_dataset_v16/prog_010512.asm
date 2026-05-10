; DESCRIPTION: Composite: Draws a yellow line from (340, 197) to (269, 121) then Creates a magenta circular shape at (79, 157) with radius 73 then Places a yellow dot at position (398, 227).
; PLAN: r0=340(x1), r1=197(y1), r2=269(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=157(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=398(x), r11=227(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 197
LDI r2, 269
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 157
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 398
LDI r11, 227
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
