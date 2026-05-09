; DESCRIPTION: Renders a white box of size 42x83 starting at (167, 14).
; PLAN: r0=167(x), r1=14(y), r2=42(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 14
LDI r2, 42
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
