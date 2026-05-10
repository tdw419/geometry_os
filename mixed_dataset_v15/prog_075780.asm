; DESCRIPTION: Places a white 34x50 rectangle at position (217, 158).
; PLAN: r0=217(x), r1=158(y), r2=34(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 158
LDI r2, 34
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
