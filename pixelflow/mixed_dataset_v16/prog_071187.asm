; DESCRIPTION: Creates a green filled rectangle of size 112x109 starting at (266, 1).
; PLAN: r0=266(x), r1=1(y), r2=112(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 1
LDI r2, 112
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
