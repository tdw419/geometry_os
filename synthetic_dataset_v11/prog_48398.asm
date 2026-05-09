; DESCRIPTION: Places a cyan 61x101 rectangle at position (59, 109).
; PLAN: r0=59(x), r1=109(y), r2=61(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 109
LDI r2, 61
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
