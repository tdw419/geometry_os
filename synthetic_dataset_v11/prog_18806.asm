; DESCRIPTION: Places a black 89x10 rectangle at position (157, 190).
; PLAN: r0=157(x), r1=190(y), r2=89(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 190
LDI r2, 89
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
