; DESCRIPTION: Renders a white box of size 108x82 starting at (99, 27).
; PLAN: r0=99(x), r1=27(y), r2=108(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 27
LDI r2, 108
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
