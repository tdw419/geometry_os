; DESCRIPTION: Places a cyan 61x101 rectangle at position (129, 72).
; PLAN: r0=129(x), r1=72(y), r2=61(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 72
LDI r2, 61
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
