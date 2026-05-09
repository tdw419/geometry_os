; DESCRIPTION: Places a blue 10x34 rectangle at position (108, 31).
; PLAN: r0=108(x), r1=31(y), r2=10(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 31
LDI r2, 10
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
