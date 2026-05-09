; DESCRIPTION: Renders a blue line between points (488, 114) and (401, 125).
; PLAN: r0=488(x1), r1=114(y1), r2=401(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 114
LDI r2, 401
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
