; DESCRIPTION: Renders a yellow line between points (196, 42) and (183, 218).
; PLAN: r0=196(x1), r1=42(y1), r2=183(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 42
LDI r2, 183
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
