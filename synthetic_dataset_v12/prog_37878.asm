; DESCRIPTION: Renders a black box of size 98x57 starting at (321, 13).
; PLAN: r0=321(x), r1=13(y), r2=98(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 13
LDI r2, 98
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
