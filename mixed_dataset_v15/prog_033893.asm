; DESCRIPTION: Places a blue 40x54 rectangle at position (39, 83).
; PLAN: r0=39(x), r1=83(y), r2=40(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 83
LDI r2, 40
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
