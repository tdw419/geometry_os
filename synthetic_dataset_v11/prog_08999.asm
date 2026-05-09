; DESCRIPTION: Renders a white box of size 42x61 starting at (9, 143).
; PLAN: r0=9(x), r1=143(y), r2=42(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 143
LDI r2, 42
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
