; DESCRIPTION: Renders a white box of size 104x40 starting at (212, 125).
; PLAN: r0=212(x), r1=125(y), r2=104(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 125
LDI r2, 104
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
