; DESCRIPTION: Places a red 41x34 box at position (323, 198).
; PLAN: r0=323(x), r1=198(y), r2=41(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 198
LDI r2, 41
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
