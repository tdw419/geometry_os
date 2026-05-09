; DESCRIPTION: Places a purple 106x42 rectangle at position (309, 160).
; PLAN: r0=309(x), r1=160(y), r2=106(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 160
LDI r2, 106
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
