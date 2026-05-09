; DESCRIPTION: Places a purple 33x83 rectangle at position (403, 56).
; PLAN: r0=403(x), r1=56(y), r2=33(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 56
LDI r2, 33
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
