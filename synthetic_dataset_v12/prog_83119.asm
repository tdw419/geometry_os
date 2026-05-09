; DESCRIPTION: Draws a white rectangle at (417, 5) with width 86 and height 10.
; PLAN: r0=417(x), r1=5(y), r2=86(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 5
LDI r2, 86
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
