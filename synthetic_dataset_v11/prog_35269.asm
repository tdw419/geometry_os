; DESCRIPTION: Places a cyan 101x101 rectangle at position (59, 76).
; PLAN: r0=59(x), r1=76(y), r2=101(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 76
LDI r2, 101
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
