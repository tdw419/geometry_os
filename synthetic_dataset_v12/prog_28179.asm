; DESCRIPTION: Draws a magenta line from (289, 114) to (322, 164).
; PLAN: r0=289(x1), r1=114(y1), r2=322(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 114
LDI r2, 322
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
