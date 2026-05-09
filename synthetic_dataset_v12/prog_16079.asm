; DESCRIPTION: Places a orange 70x16 rectangle at position (59, 238).
; PLAN: r0=59(x), r1=238(y), r2=70(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 238
LDI r2, 70
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
