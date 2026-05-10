; DESCRIPTION: Renders a blue line between points (224, 187) and (508, 16).
; PLAN: r0=224(x1), r1=187(y1), r2=508(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 187
LDI r2, 508
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
