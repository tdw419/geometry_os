; DESCRIPTION: Renders a yellow box of size 42x64 starting at (203, 75).
; PLAN: r0=203(x), r1=75(y), r2=42(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 75
LDI r2, 42
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
