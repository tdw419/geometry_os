; DESCRIPTION: Places a red 106x56 rectangle at position (310, 6).
; PLAN: r0=310(x), r1=6(y), r2=106(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 6
LDI r2, 106
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
