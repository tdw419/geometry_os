; DESCRIPTION: Places a cyan line segment connecting (466, 8) to (298, 97).
; PLAN: r0=466(x1), r1=8(y1), r2=298(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 8
LDI r2, 298
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
