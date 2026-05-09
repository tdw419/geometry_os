; DESCRIPTION: Places a green line segment connecting (215, 111) to (89, 86).
; PLAN: r0=215(x1), r1=111(y1), r2=89(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 111
LDI r2, 89
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
