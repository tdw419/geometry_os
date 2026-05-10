; DESCRIPTION: Places a red 84x24 rectangle at position (258, 5).
; PLAN: r0=258(x), r1=5(y), r2=84(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 5
LDI r2, 84
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
