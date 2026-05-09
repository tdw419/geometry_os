; DESCRIPTION: Places a white line segment connecting (150, 254) to (221, 16).
; PLAN: r0=150(x1), r1=254(y1), r2=221(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 254
LDI r2, 221
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
