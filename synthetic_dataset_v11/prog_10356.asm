; DESCRIPTION: Places a red 40x102 rectangle at position (25, 132).
; PLAN: r0=25(x), r1=132(y), r2=40(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 132
LDI r2, 40
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
