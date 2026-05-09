; DESCRIPTION: Places a yellow 86x35 rectangle at position (131, 134).
; PLAN: r0=131(x), r1=134(y), r2=86(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 134
LDI r2, 86
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
