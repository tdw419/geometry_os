; DESCRIPTION: Places a blue 23x11 rectangle at position (403, 59).
; PLAN: r0=403(x), r1=59(y), r2=23(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 59
LDI r2, 23
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
