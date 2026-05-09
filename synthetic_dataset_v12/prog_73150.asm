; DESCRIPTION: Renders a white box of size 39x115 starting at (259, 40).
; PLAN: r0=259(x), r1=40(y), r2=39(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 40
LDI r2, 39
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
