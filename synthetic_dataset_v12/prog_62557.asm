; DESCRIPTION: Renders a white box of size 63x73 starting at (413, 178).
; PLAN: r0=413(x), r1=178(y), r2=63(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 178
LDI r2, 63
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
