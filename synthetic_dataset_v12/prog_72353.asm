; DESCRIPTION: Renders a black line between points (214, 59) and (455, 125).
; PLAN: r0=214(x1), r1=59(y1), r2=455(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 59
LDI r2, 455
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
