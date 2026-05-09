; DESCRIPTION: Renders a yellow line between points (236, 42) and (217, 39).
; PLAN: r0=236(x1), r1=42(y1), r2=217(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 42
LDI r2, 217
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
