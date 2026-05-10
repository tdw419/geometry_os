; DESCRIPTION: Places a red 55x78 box at position (230, 21).
; PLAN: r0=230(x), r1=21(y), r2=55(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 21
LDI r2, 55
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
