; DESCRIPTION: Places a red 83x38 box at position (103, 36).
; PLAN: r0=103(x), r1=36(y), r2=83(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 36
LDI r2, 83
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
