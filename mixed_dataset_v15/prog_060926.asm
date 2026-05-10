; DESCRIPTION: Renders a green box of size 113x70 starting at (93, 71).
; PLAN: r0=93(x), r1=71(y), r2=113(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 71
LDI r2, 113
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
