; DESCRIPTION: Places a red 68x59 rectangle at position (145, 190).
; PLAN: r0=145(x), r1=190(y), r2=68(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 190
LDI r2, 68
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
