; DESCRIPTION: Places a cyan line segment connecting (14, 90) to (221, 210).
; PLAN: r0=14(x1), r1=90(y1), r2=221(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 90
LDI r2, 221
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
