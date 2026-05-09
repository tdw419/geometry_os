; DESCRIPTION: Renders a white line between points (224, 163) and (244, 151).
; PLAN: r0=224(x1), r1=163(y1), r2=244(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 163
LDI r2, 244
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
