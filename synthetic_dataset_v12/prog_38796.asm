; DESCRIPTION: Renders a white box of size 73x38 starting at (19, 33).
; PLAN: r0=19(x), r1=33(y), r2=73(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 33
LDI r2, 73
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
