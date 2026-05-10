; DESCRIPTION: Places a purple 95x29 rectangle at position (210, 190).
; PLAN: r0=210(x), r1=190(y), r2=95(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 190
LDI r2, 95
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
