; DESCRIPTION: Places a cyan 53x11 rectangle at position (138, 190).
; PLAN: r0=138(x), r1=190(y), r2=53(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 190
LDI r2, 53
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
