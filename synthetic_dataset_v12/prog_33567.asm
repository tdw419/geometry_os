; DESCRIPTION: Renders a blue box of size 27x38 starting at (137, 38).
; PLAN: r0=137(x), r1=38(y), r2=27(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 38
LDI r2, 27
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
