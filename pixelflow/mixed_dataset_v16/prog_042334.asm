; DESCRIPTION: Renders a white box of size 39x19 starting at (415, 130).
; PLAN: r0=415(x), r1=130(y), r2=39(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 130
LDI r2, 39
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
