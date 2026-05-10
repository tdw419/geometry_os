; DESCRIPTION: Draws a white line from (100, 139) to (446, 30).
; PLAN: r0=100(x1), r1=139(y1), r2=446(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 139
LDI r2, 446
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
