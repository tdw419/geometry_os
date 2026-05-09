; DESCRIPTION: Renders a green line between points (39, 242) and (24, 219).
; PLAN: r0=39(x1), r1=242(y1), r2=24(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 242
LDI r2, 24
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
