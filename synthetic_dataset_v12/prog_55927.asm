; DESCRIPTION: Renders a green box of size 17x57 starting at (382, 167).
; PLAN: r0=382(x), r1=167(y), r2=17(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 167
LDI r2, 17
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
