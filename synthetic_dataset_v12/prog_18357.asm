; DESCRIPTION: Places a green 76x103 rectangle at position (238, 59).
; PLAN: r0=238(x), r1=59(y), r2=76(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 59
LDI r2, 76
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
