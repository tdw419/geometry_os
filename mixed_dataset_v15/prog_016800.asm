; DESCRIPTION: Places a cyan line segment connecting (196, 200) to (303, 247).
; PLAN: r0=196(x1), r1=200(y1), r2=303(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 200
LDI r2, 303
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
