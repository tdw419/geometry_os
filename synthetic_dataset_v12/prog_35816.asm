; DESCRIPTION: Renders a black box of size 54x27 starting at (397, 166).
; PLAN: r0=397(x), r1=166(y), r2=54(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 166
LDI r2, 54
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
