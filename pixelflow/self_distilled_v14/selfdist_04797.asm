; DESCRIPTION: Draws a magenta line from (243, 67) to (225, 184).
; PLAN: r0=243(x1), r1=67(y1), r2=225(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 67
LDI r2, 225
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
