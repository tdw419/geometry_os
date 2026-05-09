; DESCRIPTION: Places a blue 15x19 rectangle at position (7, 190).
; PLAN: r0=7(x), r1=190(y), r2=15(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 190
LDI r2, 15
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
