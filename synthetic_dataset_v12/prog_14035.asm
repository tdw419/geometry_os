; DESCRIPTION: Places a green line segment connecting (103, 79) to (442, 213).
; PLAN: r0=103(x1), r1=79(y1), r2=442(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 79
LDI r2, 442
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
