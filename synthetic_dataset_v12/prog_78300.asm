; DESCRIPTION: Places a cyan line segment connecting (84, 5) to (401, 217).
; PLAN: r0=84(x1), r1=5(y1), r2=401(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 5
LDI r2, 401
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
