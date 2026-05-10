; DESCRIPTION: Renders a blue box of size 99x50 starting at (42, 90).
; PLAN: r0=42(x), r1=90(y), r2=99(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 90
LDI r2, 99
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
