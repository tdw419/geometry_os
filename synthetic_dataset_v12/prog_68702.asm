; DESCRIPTION: Renders a white box of size 115x21 starting at (240, 167).
; PLAN: r0=240(x), r1=167(y), r2=115(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 167
LDI r2, 115
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
