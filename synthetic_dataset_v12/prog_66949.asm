; DESCRIPTION: Renders a blue box of size 34x86 starting at (309, 0).
; PLAN: r0=309(x), r1=0(y), r2=34(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 0
LDI r2, 34
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
