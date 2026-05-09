; DESCRIPTION: Places a cyan line segment connecting (405, 35) to (167, 163).
; PLAN: r0=405(x1), r1=35(y1), r2=167(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 35
LDI r2, 167
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
