; DESCRIPTION: Renders a white box of size 115x82 starting at (215, 45).
; PLAN: r0=215(x), r1=45(y), r2=115(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 45
LDI r2, 115
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
