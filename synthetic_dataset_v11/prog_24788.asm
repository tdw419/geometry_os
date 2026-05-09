; DESCRIPTION: Draws a magenta line from (243, 27) to (71, 133).
; PLAN: r0=243(x1), r1=27(y1), r2=71(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 27
LDI r2, 71
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
