; DESCRIPTION: Renders a white box of size 112x53 starting at (42, 107).
; PLAN: r0=42(x), r1=107(y), r2=112(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 107
LDI r2, 112
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
