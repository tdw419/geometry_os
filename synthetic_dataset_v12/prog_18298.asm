; DESCRIPTION: Places a blue line segment connecting (173, 103) to (464, 87).
; PLAN: r0=173(x1), r1=103(y1), r2=464(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 103
LDI r2, 464
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
