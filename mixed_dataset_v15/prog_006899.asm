; DESCRIPTION: Renders a green line between points (494, 24) and (152, 28).
; PLAN: r0=494(x1), r1=24(y1), r2=152(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 24
LDI r2, 152
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
