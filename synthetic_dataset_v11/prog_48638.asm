; DESCRIPTION: Renders a green line between points (224, 164) and (29, 73).
; PLAN: r0=224(x1), r1=164(y1), r2=29(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 164
LDI r2, 29
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
