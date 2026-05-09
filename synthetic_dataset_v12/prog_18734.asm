; DESCRIPTION: Composite: Draws a cyan line from (80, 177) to (57, 14) then Places a yellow dot at position (69, 162) then Draws a magenta circle centered at (379, 114) with radius 24.
; PLAN: r0=80(x1), r1=177(y1), r2=57(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=162(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=379(x), r11=114(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 80
LDI r1, 177
LDI r2, 57
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 162
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 379
LDI r11, 114
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
