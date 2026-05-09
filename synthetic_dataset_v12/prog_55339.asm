; DESCRIPTION: Renders a black box of size 14x86 starting at (299, 95).
; PLAN: r0=299(x), r1=95(y), r2=14(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 95
LDI r2, 14
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
