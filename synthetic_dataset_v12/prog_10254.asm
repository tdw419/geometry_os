; DESCRIPTION: Places a cyan 53x33 rectangle at position (363, 190).
; PLAN: r0=363(x), r1=190(y), r2=53(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 190
LDI r2, 53
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
