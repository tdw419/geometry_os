; DESCRIPTION: Places a white 32x99 rectangle at position (149, 74).
; PLAN: r0=149(x), r1=74(y), r2=32(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 74
LDI r2, 32
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
