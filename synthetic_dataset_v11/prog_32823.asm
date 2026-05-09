; DESCRIPTION: Places a red 76x20 rectangle at position (37, 135).
; PLAN: r0=37(x), r1=135(y), r2=76(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 135
LDI r2, 76
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
