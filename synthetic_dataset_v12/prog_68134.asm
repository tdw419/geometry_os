; DESCRIPTION: Places a purple 98x42 rectangle at position (332, 9).
; PLAN: r0=332(x), r1=9(y), r2=98(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 9
LDI r2, 98
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
