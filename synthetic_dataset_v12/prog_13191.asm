; DESCRIPTION: Places a purple 72x44 rectangle at position (116, 42).
; PLAN: r0=116(x), r1=42(y), r2=72(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 42
LDI r2, 72
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
