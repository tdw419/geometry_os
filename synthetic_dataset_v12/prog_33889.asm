; DESCRIPTION: Places a blue 40x54 rectangle at position (422, 69).
; PLAN: r0=422(x), r1=69(y), r2=40(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 69
LDI r2, 40
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
