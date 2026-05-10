; DESCRIPTION: Places a red 14x43 box at position (57, 10).
; PLAN: r0=57(x), r1=10(y), r2=14(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 10
LDI r2, 14
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
