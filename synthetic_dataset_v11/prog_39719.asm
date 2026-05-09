; DESCRIPTION: Renders a blue line between points (77, 128) and (96, 42).
; PLAN: r0=77(x1), r1=128(y1), r2=96(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 128
LDI r2, 96
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
