; DESCRIPTION: Renders a green line between points (488, 21) and (87, 171).
; PLAN: r0=488(x1), r1=21(y1), r2=87(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 21
LDI r2, 87
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
