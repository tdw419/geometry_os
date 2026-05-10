; DESCRIPTION: Places a green line segment connecting (438, 116) to (143, 210).
; PLAN: r0=438(x1), r1=116(y1), r2=143(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 116
LDI r2, 143
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
