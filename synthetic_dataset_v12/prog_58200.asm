; DESCRIPTION: Places a red line segment connecting (115, 79) to (384, 242).
; PLAN: r0=115(x1), r1=79(y1), r2=384(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 79
LDI r2, 384
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
