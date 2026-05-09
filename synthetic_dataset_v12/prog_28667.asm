; DESCRIPTION: Places a cyan line segment connecting (0, 135) to (326, 196).
; PLAN: r0=0(x1), r1=135(y1), r2=326(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 135
LDI r2, 326
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
