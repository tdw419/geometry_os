; DESCRIPTION: Renders a white box of size 99x26 starting at (199, 84).
; PLAN: r0=199(x), r1=84(y), r2=99(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 84
LDI r2, 99
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
