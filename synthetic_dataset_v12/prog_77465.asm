; DESCRIPTION: Renders a white box of size 14x109 starting at (373, 42).
; PLAN: r0=373(x), r1=42(y), r2=14(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 42
LDI r2, 14
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
