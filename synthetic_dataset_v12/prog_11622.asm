; DESCRIPTION: Renders a white box of size 86x25 starting at (264, 40).
; PLAN: r0=264(x), r1=40(y), r2=86(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 40
LDI r2, 86
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
