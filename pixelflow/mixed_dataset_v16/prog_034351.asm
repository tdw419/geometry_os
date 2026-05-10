; DESCRIPTION: Places a cyan line segment connecting (500, 12) to (177, 182).
; PLAN: r0=500(x1), r1=12(y1), r2=177(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 12
LDI r2, 177
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
