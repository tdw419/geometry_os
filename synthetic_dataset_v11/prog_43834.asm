; DESCRIPTION: Renders a green line between points (16, 155) and (196, 164).
; PLAN: r0=16(x1), r1=155(y1), r2=196(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 155
LDI r2, 196
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
