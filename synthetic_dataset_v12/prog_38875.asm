; DESCRIPTION: Places a red 113x56 rectangle at position (40, 49).
; PLAN: r0=40(x), r1=49(y), r2=113(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 49
LDI r2, 113
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
