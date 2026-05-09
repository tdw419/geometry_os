; DESCRIPTION: Renders a white box of size 13x34 starting at (413, 108).
; PLAN: r0=413(x), r1=108(y), r2=13(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 108
LDI r2, 13
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
