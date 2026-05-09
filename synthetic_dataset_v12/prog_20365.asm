; DESCRIPTION: Renders a green line between points (387, 130) and (337, 40).
; PLAN: r0=387(x1), r1=130(y1), r2=337(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 130
LDI r2, 337
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
