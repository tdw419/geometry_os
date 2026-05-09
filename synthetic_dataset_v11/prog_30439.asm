; DESCRIPTION: Renders a yellow box of size 34x85 starting at (47, 44).
; PLAN: r0=47(x), r1=44(y), r2=34(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 44
LDI r2, 34
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
