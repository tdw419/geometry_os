; DESCRIPTION: Places a white 105x90 rectangle at position (153, 76).
; PLAN: r0=153(x), r1=76(y), r2=105(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 76
LDI r2, 105
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
