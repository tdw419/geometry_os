; DESCRIPTION: Places a green line segment connecting (434, 157) to (385, 225).
; PLAN: r0=434(x1), r1=157(y1), r2=385(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 157
LDI r2, 385
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
