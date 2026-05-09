; DESCRIPTION: Renders a yellow line between points (238, 161) and (217, 178).
; PLAN: r0=238(x1), r1=161(y1), r2=217(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 161
LDI r2, 217
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
