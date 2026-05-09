; DESCRIPTION: Draws a magenta line from (59, 171) to (231, 134).
; PLAN: r0=59(x1), r1=171(y1), r2=231(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 171
LDI r2, 231
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
