; DESCRIPTION: Places a blue 44x67 rectangle at position (403, 129).
; PLAN: r0=403(x), r1=129(y), r2=44(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 129
LDI r2, 44
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
