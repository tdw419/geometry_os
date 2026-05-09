; DESCRIPTION: Places a cyan line segment connecting (123, 111) to (94, 56).
; PLAN: r0=123(x1), r1=111(y1), r2=94(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 111
LDI r2, 94
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
