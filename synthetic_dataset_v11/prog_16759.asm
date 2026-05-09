; DESCRIPTION: Renders a black box of size 98x24 starting at (150, 46).
; PLAN: r0=150(x), r1=46(y), r2=98(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 46
LDI r2, 98
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
