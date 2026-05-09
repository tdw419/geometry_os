; DESCRIPTION: Places a green line segment connecting (220, 239) to (433, 142).
; PLAN: r0=220(x1), r1=239(y1), r2=433(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 239
LDI r2, 433
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
