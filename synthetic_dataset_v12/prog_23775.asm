; DESCRIPTION: Places a white 82x106 rectangle at position (356, 102).
; PLAN: r0=356(x), r1=102(y), r2=82(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 102
LDI r2, 82
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
