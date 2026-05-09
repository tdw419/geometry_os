; DESCRIPTION: Places a blue 103x35 rectangle at position (19, 204).
; PLAN: r0=19(x), r1=204(y), r2=103(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 204
LDI r2, 103
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
