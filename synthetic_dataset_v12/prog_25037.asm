; DESCRIPTION: Places a orange 99x108 rectangle at position (307, 133).
; PLAN: r0=307(x), r1=133(y), r2=99(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 133
LDI r2, 99
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
