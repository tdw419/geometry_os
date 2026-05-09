; DESCRIPTION: Places a red 91x49 rectangle at position (85, 83).
; PLAN: r0=85(x), r1=83(y), r2=91(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 83
LDI r2, 91
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
