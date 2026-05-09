; DESCRIPTION: Places a green line segment connecting (215, 223) to (157, 91).
; PLAN: r0=215(x1), r1=223(y1), r2=157(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 223
LDI r2, 157
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
