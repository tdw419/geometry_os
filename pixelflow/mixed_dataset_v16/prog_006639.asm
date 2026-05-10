; DESCRIPTION: Places a blue 80x107 rectangle at position (300, 113).
; PLAN: r0=300(x), r1=113(y), r2=80(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 113
LDI r2, 80
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
