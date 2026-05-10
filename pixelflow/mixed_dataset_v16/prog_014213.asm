; DESCRIPTION: Renders a green box of size 20x47 starting at (31, 133).
; PLAN: r0=31(x), r1=133(y), r2=20(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 133
LDI r2, 20
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
