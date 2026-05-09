; DESCRIPTION: Renders a green line between points (262, 157) and (28, 88).
; PLAN: r0=262(x1), r1=157(y1), r2=28(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 157
LDI r2, 28
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
