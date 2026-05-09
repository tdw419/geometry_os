; DESCRIPTION: Places a red 24x30 rectangle at position (105, 3).
; PLAN: r0=105(x), r1=3(y), r2=24(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 3
LDI r2, 24
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
