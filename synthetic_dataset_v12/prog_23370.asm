; DESCRIPTION: Renders a black box of size 75x109 starting at (334, 37).
; PLAN: r0=334(x), r1=37(y), r2=75(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 37
LDI r2, 75
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
