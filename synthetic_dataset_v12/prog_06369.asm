; DESCRIPTION: Renders a white box of size 99x73 starting at (4, 176).
; PLAN: r0=4(x), r1=176(y), r2=99(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 176
LDI r2, 99
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
