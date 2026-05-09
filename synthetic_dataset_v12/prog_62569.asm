; DESCRIPTION: Places a blue 17x66 rectangle at position (411, 113).
; PLAN: r0=411(x), r1=113(y), r2=17(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 113
LDI r2, 17
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
