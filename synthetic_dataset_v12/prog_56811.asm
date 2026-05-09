; DESCRIPTION: Places a red 105x78 rectangle at position (386, 178).
; PLAN: r0=386(x), r1=178(y), r2=105(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 178
LDI r2, 105
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
