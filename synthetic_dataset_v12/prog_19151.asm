; DESCRIPTION: Places a red line segment connecting (464, 168) to (326, 57).
; PLAN: r0=464(x1), r1=168(y1), r2=326(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 168
LDI r2, 326
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
