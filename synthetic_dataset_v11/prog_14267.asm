; DESCRIPTION: Places a green 108x28 rectangle at position (132, 189).
; PLAN: r0=132(x), r1=189(y), r2=108(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 189
LDI r2, 108
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
