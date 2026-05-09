; DESCRIPTION: Renders a green box of size 90x93 starting at (0, 135).
; PLAN: r0=0(x), r1=135(y), r2=90(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 135
LDI r2, 90
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
