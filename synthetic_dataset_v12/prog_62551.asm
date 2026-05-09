; DESCRIPTION: Places a cyan line segment connecting (392, 163) to (377, 239).
; PLAN: r0=392(x1), r1=163(y1), r2=377(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 163
LDI r2, 377
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
