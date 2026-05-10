; DESCRIPTION: Draws a cyan rectangle at (397, 109) with width 32 and height 103.
; PLAN: r0=397(x), r1=109(y), r2=32(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 109
LDI r2, 32
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
