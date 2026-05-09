; DESCRIPTION: Places a white line segment connecting (262, 59) to (411, 8).
; PLAN: r0=262(x1), r1=59(y1), r2=411(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 59
LDI r2, 411
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
