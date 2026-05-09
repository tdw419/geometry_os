; DESCRIPTION: Places a white line segment connecting (42, 42) to (202, 169).
; PLAN: r0=42(x1), r1=42(y1), r2=202(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 42
LDI r2, 202
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
