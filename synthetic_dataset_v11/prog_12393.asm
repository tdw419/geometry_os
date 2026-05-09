; DESCRIPTION: Renders a green line between points (174, 126) and (76, 224).
; PLAN: r0=174(x1), r1=126(y1), r2=76(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 126
LDI r2, 76
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
