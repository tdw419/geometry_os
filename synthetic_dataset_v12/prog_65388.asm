; DESCRIPTION: Places a white line segment connecting (64, 53) to (228, 143).
; PLAN: r0=64(x1), r1=53(y1), r2=228(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 53
LDI r2, 228
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
