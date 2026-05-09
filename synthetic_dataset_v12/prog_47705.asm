; DESCRIPTION: Renders a white box of size 107x84 starting at (346, 156).
; PLAN: r0=346(x), r1=156(y), r2=107(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 156
LDI r2, 107
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
