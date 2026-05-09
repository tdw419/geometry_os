; DESCRIPTION: Renders a white box of size 37x59 starting at (287, 159).
; PLAN: r0=287(x), r1=159(y), r2=37(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 159
LDI r2, 37
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
