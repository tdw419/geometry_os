; DESCRIPTION: Places a yellow line segment connecting (384, 215) to (66, 190).
; PLAN: r0=384(x1), r1=215(y1), r2=66(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 215
LDI r2, 66
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
