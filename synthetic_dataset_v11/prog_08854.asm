; DESCRIPTION: Places a white 120x12 rectangle at position (98, 11).
; PLAN: r0=98(x), r1=11(y), r2=120(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 11
LDI r2, 120
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
