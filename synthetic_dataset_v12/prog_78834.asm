; DESCRIPTION: Places a cyan line segment connecting (18, 229) to (464, 20).
; PLAN: r0=18(x1), r1=229(y1), r2=464(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 229
LDI r2, 464
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
