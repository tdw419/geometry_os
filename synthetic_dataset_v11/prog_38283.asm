; DESCRIPTION: Places a green line segment connecting (159, 152) to (64, 213).
; PLAN: r0=159(x1), r1=152(y1), r2=64(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 152
LDI r2, 64
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
