; DESCRIPTION: Draws a magenta line from (221, 130) to (342, 126).
; PLAN: r0=221(x1), r1=130(y1), r2=342(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 130
LDI r2, 342
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
