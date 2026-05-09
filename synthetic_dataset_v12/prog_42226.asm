; DESCRIPTION: Places a red line segment connecting (230, 182) to (384, 193).
; PLAN: r0=230(x1), r1=182(y1), r2=384(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 182
LDI r2, 384
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
