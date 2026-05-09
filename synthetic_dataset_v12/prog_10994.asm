; DESCRIPTION: Renders a red line between points (488, 91) and (196, 173).
; PLAN: r0=488(x1), r1=91(y1), r2=196(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 91
LDI r2, 196
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
