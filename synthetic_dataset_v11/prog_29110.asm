; DESCRIPTION: Draws a magenta line from (213, 38) to (60, 236).
; PLAN: r0=213(x1), r1=38(y1), r2=60(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 38
LDI r2, 60
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
