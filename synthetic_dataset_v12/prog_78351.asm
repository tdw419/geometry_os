; DESCRIPTION: Draws a magenta line from (151, 253) to (27, 150).
; PLAN: r0=151(x1), r1=253(y1), r2=27(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 253
LDI r2, 27
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
