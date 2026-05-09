; DESCRIPTION: Renders a black box of size 98x29 starting at (70, 109).
; PLAN: r0=70(x), r1=109(y), r2=98(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 109
LDI r2, 98
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
