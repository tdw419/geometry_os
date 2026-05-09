; DESCRIPTION: Places a green line segment connecting (32, 57) to (171, 126).
; PLAN: r0=32(x1), r1=57(y1), r2=171(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 57
LDI r2, 171
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
