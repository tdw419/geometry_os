; DESCRIPTION: Places a blue 29x40 rectangle at position (301, 14).
; PLAN: r0=301(x), r1=14(y), r2=29(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 14
LDI r2, 29
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
