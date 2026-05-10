; DESCRIPTION: Places a white line segment connecting (255, 237) to (291, 82).
; PLAN: r0=255(x1), r1=237(y1), r2=291(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 237
LDI r2, 291
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
