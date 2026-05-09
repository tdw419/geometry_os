; DESCRIPTION: Renders a yellow box of size 66x86 starting at (397, 79).
; PLAN: r0=397(x), r1=79(y), r2=66(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 79
LDI r2, 66
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
