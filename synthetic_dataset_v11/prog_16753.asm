; DESCRIPTION: Places a blue 31x50 rectangle at position (204, 94).
; PLAN: r0=204(x), r1=94(y), r2=31(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 94
LDI r2, 31
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
