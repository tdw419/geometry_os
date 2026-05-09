; DESCRIPTION: Places a red 10x13 rectangle at position (363, 135).
; PLAN: r0=363(x), r1=135(y), r2=10(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 135
LDI r2, 10
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
