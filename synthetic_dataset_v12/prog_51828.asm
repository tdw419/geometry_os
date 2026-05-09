; DESCRIPTION: Places a green line segment connecting (90, 215) to (509, 152).
; PLAN: r0=90(x1), r1=215(y1), r2=509(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 215
LDI r2, 509
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
