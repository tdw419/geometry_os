; DESCRIPTION: Renders a green box of size 93x34 starting at (70, 140).
; PLAN: r0=70(x), r1=140(y), r2=93(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 140
LDI r2, 93
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
