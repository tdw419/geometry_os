; DESCRIPTION: Renders a white box of size 39x73 starting at (425, 2).
; PLAN: r0=425(x), r1=2(y), r2=39(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 2
LDI r2, 39
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
