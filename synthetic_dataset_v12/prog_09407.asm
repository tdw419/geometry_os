; DESCRIPTION: Places a cyan line segment connecting (473, 19) to (398, 36).
; PLAN: r0=473(x1), r1=19(y1), r2=398(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 19
LDI r2, 398
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
