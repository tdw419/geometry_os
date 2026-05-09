; DESCRIPTION: Places a blue 53x39 rectangle at position (17, 143).
; PLAN: r0=17(x), r1=143(y), r2=53(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 143
LDI r2, 53
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
