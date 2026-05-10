; DESCRIPTION: Places a red 18x71 box at position (78, 187).
; PLAN: r0=78(x), r1=187(y), r2=18(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 187
LDI r2, 18
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
