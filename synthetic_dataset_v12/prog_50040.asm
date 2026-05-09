; DESCRIPTION: Places a green line segment connecting (191, 107) to (435, 195).
; PLAN: r0=191(x1), r1=107(y1), r2=435(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 107
LDI r2, 435
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
