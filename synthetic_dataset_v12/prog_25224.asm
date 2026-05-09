; DESCRIPTION: Renders a white box of size 100x47 starting at (198, 26).
; PLAN: r0=198(x), r1=26(y), r2=100(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 26
LDI r2, 100
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
