; DESCRIPTION: Places a yellow 71x60 rectangle at position (123, 190).
; PLAN: r0=123(x), r1=190(y), r2=71(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 190
LDI r2, 71
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
