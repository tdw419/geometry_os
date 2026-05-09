; DESCRIPTION: Places a red 76x40 rectangle at position (5, 133).
; PLAN: r0=5(x), r1=133(y), r2=76(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 133
LDI r2, 76
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
