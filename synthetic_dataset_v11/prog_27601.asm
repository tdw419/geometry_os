; DESCRIPTION: Places a white 75x43 rectangle at position (81, 76).
; PLAN: r0=81(x), r1=76(y), r2=75(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 76
LDI r2, 75
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
