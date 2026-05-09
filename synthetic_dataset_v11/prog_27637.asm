; DESCRIPTION: Places a white 119x60 rectangle at position (98, 102).
; PLAN: r0=98(x), r1=102(y), r2=119(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 102
LDI r2, 119
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
