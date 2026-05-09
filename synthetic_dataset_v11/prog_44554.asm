; DESCRIPTION: Places a cyan line segment connecting (69, 120) to (221, 105).
; PLAN: r0=69(x1), r1=120(y1), r2=221(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 120
LDI r2, 221
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
