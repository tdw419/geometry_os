; DESCRIPTION: Places a blue 28x109 rectangle at position (234, 73).
; PLAN: r0=234(x), r1=73(y), r2=28(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 73
LDI r2, 28
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
