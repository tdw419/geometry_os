; DESCRIPTION: Renders a white box of size 62x21 starting at (337, 191).
; PLAN: r0=337(x), r1=191(y), r2=62(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 191
LDI r2, 62
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
