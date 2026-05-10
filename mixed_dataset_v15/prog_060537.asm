; DESCRIPTION: Places a purple 39x46 rectangle at position (263, 126).
; PLAN: r0=263(x), r1=126(y), r2=39(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 126
LDI r2, 39
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
