; DESCRIPTION: Places a cyan line segment connecting (0, 138) to (338, 202).
; PLAN: r0=0(x1), r1=138(y1), r2=338(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 138
LDI r2, 338
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
