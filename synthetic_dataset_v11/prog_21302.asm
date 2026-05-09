; DESCRIPTION: Renders a green box of size 93x35 starting at (117, 102).
; PLAN: r0=117(x), r1=102(y), r2=93(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 102
LDI r2, 93
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
