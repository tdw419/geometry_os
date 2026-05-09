; DESCRIPTION: Renders a blue box of size 21x90 starting at (397, 91).
; PLAN: r0=397(x), r1=91(y), r2=21(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 91
LDI r2, 21
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
