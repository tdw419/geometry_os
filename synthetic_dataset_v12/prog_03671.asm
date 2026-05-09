; DESCRIPTION: Places a red 38x40 rectangle at position (34, 79).
; PLAN: r0=34(x), r1=79(y), r2=38(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 79
LDI r2, 38
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
