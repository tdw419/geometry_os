; DESCRIPTION: Renders a white box of size 107x86 starting at (0, 15).
; PLAN: r0=0(x), r1=15(y), r2=107(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 15
LDI r2, 107
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
