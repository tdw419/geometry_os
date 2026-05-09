; DESCRIPTION: Renders a green line between points (457, 27) and (46, 24).
; PLAN: r0=457(x1), r1=27(y1), r2=46(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 27
LDI r2, 46
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
