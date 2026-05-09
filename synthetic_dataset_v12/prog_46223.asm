; DESCRIPTION: Places a red 85x82 rectangle at position (77, 78).
; PLAN: r0=77(x), r1=78(y), r2=85(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 78
LDI r2, 85
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
