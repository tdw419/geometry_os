; DESCRIPTION: Places a red 67x98 box at position (80, 4).
; PLAN: r0=80(x), r1=4(y), r2=67(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 4
LDI r2, 67
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
