; DESCRIPTION: Places a blue 38x84 rectangle at position (206, 98).
; PLAN: r0=206(x), r1=98(y), r2=38(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 98
LDI r2, 38
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
