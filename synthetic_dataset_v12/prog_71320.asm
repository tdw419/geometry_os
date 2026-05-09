; DESCRIPTION: Places a cyan line segment connecting (336, 150) to (80, 132).
; PLAN: r0=336(x1), r1=150(y1), r2=80(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 150
LDI r2, 80
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
