; DESCRIPTION: Renders a green line between points (168, 128) and (238, 25).
; PLAN: r0=168(x1), r1=128(y1), r2=238(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 128
LDI r2, 238
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
