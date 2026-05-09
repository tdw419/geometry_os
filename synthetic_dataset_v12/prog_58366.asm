; DESCRIPTION: Places a green line segment connecting (255, 197) to (171, 8).
; PLAN: r0=255(x1), r1=197(y1), r2=171(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 197
LDI r2, 171
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
