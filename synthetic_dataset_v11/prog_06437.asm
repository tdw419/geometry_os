; DESCRIPTION: Draws a magenta line from (74, 48) to (213, 176).
; PLAN: r0=74(x1), r1=48(y1), r2=213(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 48
LDI r2, 213
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
