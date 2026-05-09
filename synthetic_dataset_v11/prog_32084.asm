; DESCRIPTION: Places a green 69x43 rectangle at position (11, 190).
; PLAN: r0=11(x), r1=190(y), r2=69(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 190
LDI r2, 69
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
