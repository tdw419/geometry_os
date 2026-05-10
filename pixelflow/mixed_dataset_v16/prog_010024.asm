; DESCRIPTION: Renders a blue box of size 42x19 starting at (284, 27).
; PLAN: r0=284(x), r1=27(y), r2=42(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 27
LDI r2, 42
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
