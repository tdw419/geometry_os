; DESCRIPTION: Places a red 38x52 box at position (301, 7).
; PLAN: r0=301(x), r1=7(y), r2=38(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 7
LDI r2, 38
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
