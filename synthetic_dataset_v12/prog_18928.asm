; DESCRIPTION: Places a yellow line segment connecting (384, 227) to (228, 177).
; PLAN: r0=384(x1), r1=227(y1), r2=228(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 227
LDI r2, 228
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
