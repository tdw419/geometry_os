; DESCRIPTION: Renders a black box of size 12x16 starting at (98, 141).
; PLAN: r0=98(x), r1=141(y), r2=12(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 141
LDI r2, 12
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
