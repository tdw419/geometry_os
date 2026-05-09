; DESCRIPTION: Places a purple 59x84 rectangle at position (239, 120).
; PLAN: r0=239(x), r1=120(y), r2=59(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 120
LDI r2, 59
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
