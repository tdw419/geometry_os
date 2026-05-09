; DESCRIPTION: Places a blue 43x10 rectangle at position (113, 76).
; PLAN: r0=113(x), r1=76(y), r2=43(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 76
LDI r2, 43
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
