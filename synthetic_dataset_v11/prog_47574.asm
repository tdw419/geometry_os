; DESCRIPTION: Places a blue 64x43 rectangle at position (91, 6).
; PLAN: r0=91(x), r1=6(y), r2=64(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 6
LDI r2, 64
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
