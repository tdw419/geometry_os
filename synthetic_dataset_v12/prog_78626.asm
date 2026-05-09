; DESCRIPTION: Places a white line segment connecting (487, 57) to (184, 82).
; PLAN: r0=487(x1), r1=57(y1), r2=184(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 57
LDI r2, 184
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
