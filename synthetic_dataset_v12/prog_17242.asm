; DESCRIPTION: Places a blue 22x62 rectangle at position (367, 57).
; PLAN: r0=367(x), r1=57(y), r2=22(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 57
LDI r2, 22
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
