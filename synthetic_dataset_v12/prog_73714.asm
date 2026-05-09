; DESCRIPTION: Places a white line segment connecting (239, 32) to (61, 53).
; PLAN: r0=239(x1), r1=32(y1), r2=61(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 32
LDI r2, 61
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
