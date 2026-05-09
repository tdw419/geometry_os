; DESCRIPTION: Renders a black box of size 42x108 starting at (94, 75).
; PLAN: r0=94(x), r1=75(y), r2=42(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 75
LDI r2, 42
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
