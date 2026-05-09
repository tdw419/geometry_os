; DESCRIPTION: Renders a white box of size 43x42 starting at (83, 82).
; PLAN: r0=83(x), r1=82(y), r2=43(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 82
LDI r2, 43
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
