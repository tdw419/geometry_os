; DESCRIPTION: Places a white 102x60 rectangle at position (59, 66).
; PLAN: r0=59(x), r1=66(y), r2=102(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 66
LDI r2, 102
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
