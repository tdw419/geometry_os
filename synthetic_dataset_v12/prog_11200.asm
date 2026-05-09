; DESCRIPTION: Places a white line segment connecting (320, 101) to (384, 161).
; PLAN: r0=320(x1), r1=101(y1), r2=384(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 101
LDI r2, 384
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
