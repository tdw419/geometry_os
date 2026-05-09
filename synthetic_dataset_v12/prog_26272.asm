; DESCRIPTION: Renders a purple line between points (502, 42) and (1, 108).
; PLAN: r0=502(x1), r1=42(y1), r2=1(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 42
LDI r2, 1
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
