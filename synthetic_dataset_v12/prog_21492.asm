; DESCRIPTION: Places a purple 39x36 rectangle at position (340, 108).
; PLAN: r0=340(x), r1=108(y), r2=39(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 108
LDI r2, 39
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
