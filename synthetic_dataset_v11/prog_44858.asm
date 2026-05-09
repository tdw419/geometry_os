; DESCRIPTION: Places a purple 27x60 rectangle at position (116, 190).
; PLAN: r0=116(x), r1=190(y), r2=27(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 190
LDI r2, 27
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
