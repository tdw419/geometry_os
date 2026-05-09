; DESCRIPTION: Renders a white box of size 82x68 starting at (69, 165).
; PLAN: r0=69(x), r1=165(y), r2=82(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 165
LDI r2, 82
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
