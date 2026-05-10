; DESCRIPTION: Places a green line segment connecting (29, 184) to (365, 154).
; PLAN: r0=29(x1), r1=184(y1), r2=365(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 184
LDI r2, 365
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
