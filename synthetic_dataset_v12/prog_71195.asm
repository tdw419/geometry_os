; DESCRIPTION: Places a blue 103x76 rectangle at position (173, 136).
; PLAN: r0=173(x), r1=136(y), r2=103(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 136
LDI r2, 103
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
