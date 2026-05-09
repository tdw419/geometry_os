; DESCRIPTION: Places a red 56x39 rectangle at position (116, 190).
; PLAN: r0=116(x), r1=190(y), r2=56(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 190
LDI r2, 56
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
