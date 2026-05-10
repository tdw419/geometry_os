; DESCRIPTION: Places a cyan line segment connecting (392, 5) to (108, 233).
; PLAN: r0=392(x1), r1=5(y1), r2=108(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 5
LDI r2, 108
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
