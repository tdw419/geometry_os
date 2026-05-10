; DESCRIPTION: Renders a magenta line between points (293, 67) and (243, 40).
; PLAN: r0=293(x1), r1=67(y1), r2=243(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 67
LDI r2, 243
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
