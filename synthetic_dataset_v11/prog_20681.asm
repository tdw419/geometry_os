; DESCRIPTION: Renders a white box of size 82x66 starting at (161, 108).
; PLAN: r0=161(x), r1=108(y), r2=82(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 108
LDI r2, 82
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
