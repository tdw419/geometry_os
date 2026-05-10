; DESCRIPTION: Places a green line segment connecting (167, 173) to (461, 21).
; PLAN: r0=167(x1), r1=173(y1), r2=461(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 173
LDI r2, 461
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
