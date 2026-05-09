; DESCRIPTION: Renders a green box of size 74x86 starting at (184, 68).
; PLAN: r0=184(x), r1=68(y), r2=74(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 68
LDI r2, 74
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
