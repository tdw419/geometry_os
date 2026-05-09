; DESCRIPTION: Renders a green line between points (372, 108) and (356, 172).
; PLAN: r0=372(x1), r1=108(y1), r2=356(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 108
LDI r2, 356
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
