; DESCRIPTION: Renders a white box of size 31x24 starting at (240, 163).
; PLAN: r0=240(x), r1=163(y), r2=31(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 163
LDI r2, 31
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
