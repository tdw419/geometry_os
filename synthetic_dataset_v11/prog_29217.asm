; DESCRIPTION: Places a cyan line segment connecting (113, 108) to (134, 220).
; PLAN: r0=113(x1), r1=108(y1), r2=134(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 108
LDI r2, 134
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
