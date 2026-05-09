; DESCRIPTION: Renders a green box of size 95x18 starting at (70, 93).
; PLAN: r0=70(x), r1=93(y), r2=95(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 93
LDI r2, 95
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
