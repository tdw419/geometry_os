; DESCRIPTION: Renders a white box of size 52x46 starting at (156, 125).
; PLAN: r0=156(x), r1=125(y), r2=52(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 125
LDI r2, 52
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
