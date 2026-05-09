; DESCRIPTION: Renders a green box of size 119x62 starting at (112, 150).
; PLAN: r0=112(x), r1=150(y), r2=119(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 150
LDI r2, 119
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
