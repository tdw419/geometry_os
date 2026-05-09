; DESCRIPTION: Renders a green box of size 31x11 starting at (34, 44).
; PLAN: r0=34(x), r1=44(y), r2=31(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 44
LDI r2, 31
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
