; DESCRIPTION: Places a cyan line segment connecting (402, 53) to (232, 103).
; PLAN: r0=402(x1), r1=53(y1), r2=232(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 53
LDI r2, 232
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
