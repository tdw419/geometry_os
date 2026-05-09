; DESCRIPTION: Renders a yellow box of size 93x86 starting at (167, 155).
; PLAN: r0=167(x), r1=155(y), r2=93(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 155
LDI r2, 93
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
