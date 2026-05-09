; DESCRIPTION: Renders a white line between points (19, 167) and (238, 210).
; PLAN: r0=19(x1), r1=167(y1), r2=238(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 167
LDI r2, 238
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
