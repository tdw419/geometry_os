; DESCRIPTION: Places a green line segment connecting (379, 138) to (206, 171).
; PLAN: r0=379(x1), r1=138(y1), r2=206(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 138
LDI r2, 206
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
