; DESCRIPTION: Renders a white box of size 52x32 starting at (283, 49).
; PLAN: r0=283(x), r1=49(y), r2=52(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 49
LDI r2, 52
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
