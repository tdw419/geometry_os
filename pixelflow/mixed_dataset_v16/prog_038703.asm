; DESCRIPTION: Renders a blue line between points (365, 196) and (115, 146).
; PLAN: r0=365(x1), r1=196(y1), r2=115(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 196
LDI r2, 115
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
