; DESCRIPTION: Places a yellow 19x98 rectangle at position (480, 158).
; PLAN: r0=480(x), r1=158(y), r2=19(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 158
LDI r2, 19
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
