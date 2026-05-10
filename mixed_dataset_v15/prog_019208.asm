; DESCRIPTION: Places a cyan line segment connecting (64, 10) to (464, 58).
; PLAN: r0=64(x1), r1=10(y1), r2=464(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 10
LDI r2, 464
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
