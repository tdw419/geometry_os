; DESCRIPTION: Renders a blue box of size 30x39 starting at (328, 32).
; PLAN: r0=328(x), r1=32(y), r2=30(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 32
LDI r2, 30
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
