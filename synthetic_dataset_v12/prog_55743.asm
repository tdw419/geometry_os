; DESCRIPTION: Composite: Draws a yellow line from (237, 51) to (59, 101) then Places a magenta dot at position (307, 90).
; PLAN: r0=237(x1), r1=51(y1), r2=59(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=90(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 51
LDI r2, 59
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 90
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
