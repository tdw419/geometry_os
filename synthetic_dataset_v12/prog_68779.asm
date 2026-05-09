; DESCRIPTION: Places a purple 26x63 rectangle at position (405, 142).
; PLAN: r0=405(x), r1=142(y), r2=26(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 142
LDI r2, 26
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
