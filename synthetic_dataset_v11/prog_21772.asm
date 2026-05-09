; DESCRIPTION: Places a cyan line segment connecting (61, 181) to (176, 20).
; PLAN: r0=61(x1), r1=181(y1), r2=176(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 181
LDI r2, 176
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
