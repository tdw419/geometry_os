; DESCRIPTION: Renders a white box of size 76x63 starting at (215, 26).
; PLAN: r0=215(x), r1=26(y), r2=76(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 26
LDI r2, 76
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
