; DESCRIPTION: Renders a white line between points (24, 168) and (209, 238).
; PLAN: r0=24(x1), r1=168(y1), r2=209(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 168
LDI r2, 209
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
