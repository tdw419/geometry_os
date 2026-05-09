; DESCRIPTION: Places a blue 46x82 rectangle at position (54, 110).
; PLAN: r0=54(x), r1=110(y), r2=46(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 110
LDI r2, 46
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
