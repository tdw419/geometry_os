; DESCRIPTION: Renders a green line between points (337, 23) and (488, 113).
; PLAN: r0=337(x1), r1=23(y1), r2=488(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 23
LDI r2, 488
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
