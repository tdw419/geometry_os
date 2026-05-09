; DESCRIPTION: Renders a white box of size 85x77 starting at (239, 149).
; PLAN: r0=239(x), r1=149(y), r2=85(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 149
LDI r2, 85
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
