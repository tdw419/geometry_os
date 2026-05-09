; DESCRIPTION: Places a cyan 16x59 rectangle at position (10, 149).
; PLAN: r0=10(x), r1=149(y), r2=16(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 149
LDI r2, 16
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
