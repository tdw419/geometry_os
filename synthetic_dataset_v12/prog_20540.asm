; DESCRIPTION: Renders a blue box of size 76x96 starting at (284, 126).
; PLAN: r0=284(x), r1=126(y), r2=76(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 126
LDI r2, 76
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
