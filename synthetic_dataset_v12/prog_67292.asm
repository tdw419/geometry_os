; DESCRIPTION: Renders a green box of size 93x93 starting at (168, 6).
; PLAN: r0=168(x), r1=6(y), r2=93(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 6
LDI r2, 93
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
