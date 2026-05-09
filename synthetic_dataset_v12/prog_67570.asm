; DESCRIPTION: Renders a white box of size 58x109 starting at (241, 144).
; PLAN: r0=241(x), r1=144(y), r2=58(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 144
LDI r2, 58
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
