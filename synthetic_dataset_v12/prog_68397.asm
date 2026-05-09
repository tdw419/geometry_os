; DESCRIPTION: Renders a white box of size 96x42 starting at (143, 33).
; PLAN: r0=143(x), r1=33(y), r2=96(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 33
LDI r2, 96
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
