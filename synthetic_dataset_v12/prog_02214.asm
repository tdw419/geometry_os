; DESCRIPTION: Composite: Draws a magenta line from (86, 193) to (76, 22) then Places a black dot at position (330, 116).
; PLAN: r0=86(x1), r1=193(y1), r2=76(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=116(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 193
LDI r2, 76
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 116
LDI r7, 0x000000
PSET r5, r6, r7
HALT
