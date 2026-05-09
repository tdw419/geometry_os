; DESCRIPTION: Places a red 79x82 rectangle at position (30, 31).
; PLAN: r0=30(x), r1=31(y), r2=79(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 31
LDI r2, 79
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
