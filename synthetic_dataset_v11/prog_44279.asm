; DESCRIPTION: Places a white line segment connecting (165, 93) to (210, 206).
; PLAN: r0=165(x1), r1=93(y1), r2=210(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 93
LDI r2, 210
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
