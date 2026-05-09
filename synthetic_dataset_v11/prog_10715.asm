; DESCRIPTION: Renders a green box of size 21x93 starting at (185, 93).
; PLAN: r0=185(x), r1=93(y), r2=21(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 93
LDI r2, 21
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
