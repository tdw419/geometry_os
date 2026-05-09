; DESCRIPTION: Draws a white line from (393, 225) to (238, 180).
; PLAN: r0=393(x1), r1=225(y1), r2=238(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 225
LDI r2, 238
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
