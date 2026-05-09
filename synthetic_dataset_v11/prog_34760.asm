; DESCRIPTION: Renders a green box of size 38x21 starting at (159, 34).
; PLAN: r0=159(x), r1=34(y), r2=38(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 34
LDI r2, 38
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
