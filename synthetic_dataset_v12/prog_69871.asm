; DESCRIPTION: Places a purple 107x39 rectangle at position (328, 137).
; PLAN: r0=328(x), r1=137(y), r2=107(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 137
LDI r2, 107
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
