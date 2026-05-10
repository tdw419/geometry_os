; DESCRIPTION: Renders a blue box of size 30x63 starting at (262, 27).
; PLAN: r0=262(x), r1=27(y), r2=30(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 27
LDI r2, 30
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
