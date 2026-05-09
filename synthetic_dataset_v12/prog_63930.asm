; DESCRIPTION: Draws a purple line from (426, 228) to (66, 196).
; PLAN: r0=426(x1), r1=228(y1), r2=66(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 228
LDI r2, 66
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
