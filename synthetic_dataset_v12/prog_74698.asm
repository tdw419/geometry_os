; DESCRIPTION: Places a yellow line segment connecting (438, 126) to (410, 117).
; PLAN: r0=438(x1), r1=126(y1), r2=410(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 126
LDI r2, 410
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
