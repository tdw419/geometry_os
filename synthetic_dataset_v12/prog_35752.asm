; DESCRIPTION: Renders a white line between points (38, 32) and (230, 10).
; PLAN: r0=38(x1), r1=32(y1), r2=230(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 32
LDI r2, 230
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
