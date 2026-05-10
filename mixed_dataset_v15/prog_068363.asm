; DESCRIPTION: Places a green line segment connecting (387, 150) to (74, 21).
; PLAN: r0=387(x1), r1=150(y1), r2=74(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 150
LDI r2, 74
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
