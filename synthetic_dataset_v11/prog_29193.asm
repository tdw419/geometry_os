; DESCRIPTION: Places a white line segment connecting (198, 93) to (171, 8).
; PLAN: r0=198(x1), r1=93(y1), r2=171(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 93
LDI r2, 171
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
