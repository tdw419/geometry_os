; DESCRIPTION: Renders a green line between points (189, 61) and (236, 30).
; PLAN: r0=189(x1), r1=61(y1), r2=236(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 61
LDI r2, 236
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
