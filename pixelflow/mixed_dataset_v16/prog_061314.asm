; DESCRIPTION: Draws a magenta line from (243, 168) to (473, 210).
; PLAN: r0=243(x1), r1=168(y1), r2=473(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 168
LDI r2, 473
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
