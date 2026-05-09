; DESCRIPTION: Draws a white line from (238, 126) to (48, 22).
; PLAN: r0=238(x1), r1=126(y1), r2=48(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 126
LDI r2, 48
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
