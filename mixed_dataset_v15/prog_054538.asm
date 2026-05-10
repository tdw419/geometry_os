; DESCRIPTION: Places a white 15x26 rectangle at position (305, 106).
; PLAN: r0=305(x), r1=106(y), r2=15(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 106
LDI r2, 15
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
