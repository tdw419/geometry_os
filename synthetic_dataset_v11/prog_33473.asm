; DESCRIPTION: Renders a green box of size 95x120 starting at (93, 102).
; PLAN: r0=93(x), r1=102(y), r2=95(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 102
LDI r2, 95
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
