; DESCRIPTION: Renders a white line between points (485, 111) and (349, 114).
; PLAN: r0=485(x1), r1=111(y1), r2=349(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 111
LDI r2, 349
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
