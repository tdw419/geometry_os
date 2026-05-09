; DESCRIPTION: Places a blue 39x39 rectangle at position (110, 13).
; PLAN: r0=110(x), r1=13(y), r2=39(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 13
LDI r2, 39
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
