; DESCRIPTION: Renders a white box of size 29x104 starting at (196, 39).
; PLAN: r0=196(x), r1=39(y), r2=29(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 39
LDI r2, 29
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
