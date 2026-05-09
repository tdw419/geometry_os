; DESCRIPTION: Renders a red box of size 21x86 starting at (101, 66).
; PLAN: r0=101(x), r1=66(y), r2=21(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 66
LDI r2, 21
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
