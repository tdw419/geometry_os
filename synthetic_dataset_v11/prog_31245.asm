; DESCRIPTION: Renders a white box of size 27x18 starting at (144, 74).
; PLAN: r0=144(x), r1=74(y), r2=27(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 74
LDI r2, 27
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
