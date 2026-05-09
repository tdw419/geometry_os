; DESCRIPTION: Places a blue 20x39 rectangle at position (225, 204).
; PLAN: r0=225(x), r1=204(y), r2=20(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 204
LDI r2, 20
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
