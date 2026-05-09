; DESCRIPTION: Renders a white box of size 70x44 starting at (37, 59).
; PLAN: r0=37(x), r1=59(y), r2=70(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 59
LDI r2, 70
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
