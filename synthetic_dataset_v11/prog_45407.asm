; DESCRIPTION: Places a cyan line segment connecting (74, 174) to (211, 12).
; PLAN: r0=74(x1), r1=174(y1), r2=211(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 174
LDI r2, 211
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
