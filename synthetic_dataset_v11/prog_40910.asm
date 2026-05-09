; DESCRIPTION: Renders a green line between points (45, 207) and (219, 134).
; PLAN: r0=45(x1), r1=207(y1), r2=219(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 207
LDI r2, 219
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
