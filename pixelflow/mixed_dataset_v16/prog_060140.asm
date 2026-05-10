; DESCRIPTION: Places a green 32x53 rectangle at position (238, 190).
; PLAN: r0=238(x), r1=190(y), r2=32(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 190
LDI r2, 32
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
