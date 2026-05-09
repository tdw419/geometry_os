; DESCRIPTION: Places a purple 55x58 rectangle at position (74, 42).
; PLAN: r0=74(x), r1=42(y), r2=55(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 42
LDI r2, 55
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
