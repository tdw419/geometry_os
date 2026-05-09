; DESCRIPTION: Places a cyan line segment connecting (29, 202) to (511, 202).
; PLAN: r0=29(x1), r1=202(y1), r2=511(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 202
LDI r2, 511
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
