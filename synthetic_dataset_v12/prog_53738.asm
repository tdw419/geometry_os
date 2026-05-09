; DESCRIPTION: Places a white line segment connecting (53, 169) to (210, 228).
; PLAN: r0=53(x1), r1=169(y1), r2=210(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 169
LDI r2, 210
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
