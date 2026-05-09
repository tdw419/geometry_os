; DESCRIPTION: Renders a white box of size 39x22 starting at (174, 224).
; PLAN: r0=174(x), r1=224(y), r2=39(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 224
LDI r2, 39
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
