; DESCRIPTION: Places a blue 99x16 rectangle at position (76, 173).
; PLAN: r0=76(x), r1=173(y), r2=99(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 173
LDI r2, 99
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
