; DESCRIPTION: Places a blue 83x80 rectangle at position (7, 135).
; PLAN: r0=7(x), r1=135(y), r2=83(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 135
LDI r2, 83
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
