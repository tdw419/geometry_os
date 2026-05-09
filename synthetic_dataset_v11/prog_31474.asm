; DESCRIPTION: Places a purple 39x50 rectangle at position (57, 108).
; PLAN: r0=57(x), r1=108(y), r2=39(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 108
LDI r2, 39
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
