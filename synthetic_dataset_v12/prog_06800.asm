; DESCRIPTION: Renders a green box of size 37x53 starting at (168, 77).
; PLAN: r0=168(x), r1=77(y), r2=37(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 77
LDI r2, 37
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
