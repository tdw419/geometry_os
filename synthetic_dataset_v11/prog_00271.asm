; DESCRIPTION: Renders a white box of size 113x59 starting at (83, 100).
; PLAN: r0=83(x), r1=100(y), r2=113(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 100
LDI r2, 113
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
