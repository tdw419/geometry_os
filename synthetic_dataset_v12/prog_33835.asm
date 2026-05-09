; DESCRIPTION: Places a yellow 25x40 rectangle at position (30, 70).
; PLAN: r0=30(x), r1=70(y), r2=25(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 70
LDI r2, 25
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
