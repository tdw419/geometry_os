; DESCRIPTION: Renders a white line between points (394, 135) and (349, 225).
; PLAN: r0=394(x1), r1=135(y1), r2=349(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 135
LDI r2, 349
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
