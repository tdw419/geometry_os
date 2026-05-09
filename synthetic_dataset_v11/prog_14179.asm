; DESCRIPTION: Renders a blue box of size 11x90 starting at (120, 42).
; PLAN: r0=120(x), r1=42(y), r2=11(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 42
LDI r2, 11
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
