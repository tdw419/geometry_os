; DESCRIPTION: Places a blue 17x68 rectangle at position (328, 29).
; PLAN: r0=328(x), r1=29(y), r2=17(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 29
LDI r2, 17
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
