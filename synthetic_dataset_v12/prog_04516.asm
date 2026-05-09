; DESCRIPTION: Places a purple 23x109 rectangle at position (239, 7).
; PLAN: r0=239(x), r1=7(y), r2=23(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 7
LDI r2, 23
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
