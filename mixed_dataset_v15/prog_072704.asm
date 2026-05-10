; DESCRIPTION: Places a purple 42x39 box at position (268, 186).
; PLAN: r0=268(x), r1=186(y), r2=42(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 186
LDI r2, 42
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
