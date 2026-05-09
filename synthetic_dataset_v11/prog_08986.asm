; DESCRIPTION: Places a purple 43x29 rectangle at position (50, 192).
; PLAN: r0=50(x), r1=192(y), r2=43(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 192
LDI r2, 43
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
