; DESCRIPTION: Renders a white box of size 42x63 starting at (151, 192).
; PLAN: r0=151(x), r1=192(y), r2=42(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 192
LDI r2, 42
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
