; DESCRIPTION: Places a green 111x36 rectangle at position (397, 216).
; PLAN: r0=397(x), r1=216(y), r2=111(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 216
LDI r2, 111
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
