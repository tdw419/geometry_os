; DESCRIPTION: Draws a magenta line from (234, 247) to (196, 253).
; PLAN: r0=234(x1), r1=247(y1), r2=196(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 247
LDI r2, 196
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
