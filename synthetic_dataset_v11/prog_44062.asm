; DESCRIPTION: Places a white 34x82 rectangle at position (75, 7).
; PLAN: r0=75(x), r1=7(y), r2=34(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 7
LDI r2, 34
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
