; DESCRIPTION: Renders a red box of size 63x57 starting at (397, 103).
; PLAN: r0=397(x), r1=103(y), r2=63(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 103
LDI r2, 63
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
