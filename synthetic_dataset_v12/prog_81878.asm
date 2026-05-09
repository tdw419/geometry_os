; DESCRIPTION: Places a yellow 10x117 rectangle at position (190, 11).
; PLAN: r0=190(x), r1=11(y), r2=10(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 11
LDI r2, 10
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
