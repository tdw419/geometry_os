; DESCRIPTION: Renders a white box of size 108x56 starting at (91, 12).
; PLAN: r0=91(x), r1=12(y), r2=108(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 12
LDI r2, 108
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
