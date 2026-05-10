; DESCRIPTION: Places a blue 22x39 rectangle at position (95, 31).
; PLAN: r0=95(x), r1=31(y), r2=22(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 31
LDI r2, 22
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
