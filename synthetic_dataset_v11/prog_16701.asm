; DESCRIPTION: Places a cyan line segment connecting (3, 220) to (138, 187).
; PLAN: r0=3(x1), r1=220(y1), r2=138(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 220
LDI r2, 138
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
