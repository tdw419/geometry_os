; DESCRIPTION: Renders a white box of size 90x12 starting at (196, 206).
; PLAN: r0=196(x), r1=206(y), r2=90(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 206
LDI r2, 90
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
