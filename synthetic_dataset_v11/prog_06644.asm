; DESCRIPTION: Places a cyan line segment connecting (81, 174) to (48, 31).
; PLAN: r0=81(x1), r1=174(y1), r2=48(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 174
LDI r2, 48
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
