; DESCRIPTION: Renders a white line between points (102, 143) and (326, 221).
; PLAN: r0=102(x1), r1=143(y1), r2=326(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 143
LDI r2, 326
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
