; DESCRIPTION: Places a red 99x99 box at position (379, 38).
; PLAN: r0=379(x), r1=38(y), r2=99(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 38
LDI r2, 99
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
