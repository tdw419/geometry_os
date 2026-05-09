; DESCRIPTION: Renders a yellow line between points (196, 212) and (354, 243).
; PLAN: r0=196(x1), r1=212(y1), r2=354(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 212
LDI r2, 354
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
