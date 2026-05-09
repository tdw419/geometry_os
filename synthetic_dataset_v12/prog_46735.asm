; DESCRIPTION: Places a black 53x42 rectangle at position (277, 190).
; PLAN: r0=277(x), r1=190(y), r2=53(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 190
LDI r2, 53
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
