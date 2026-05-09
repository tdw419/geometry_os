; DESCRIPTION: Places a white line segment connecting (161, 215) to (224, 24).
; PLAN: r0=161(x1), r1=215(y1), r2=224(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 215
LDI r2, 224
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
