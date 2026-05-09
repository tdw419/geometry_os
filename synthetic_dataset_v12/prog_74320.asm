; DESCRIPTION: Renders a green line between points (330, 62) and (61, 8).
; PLAN: r0=330(x1), r1=62(y1), r2=61(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 62
LDI r2, 61
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
