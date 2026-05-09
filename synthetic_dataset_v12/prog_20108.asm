; DESCRIPTION: Places a white 115x46 rectangle at position (38, 26).
; PLAN: r0=38(x), r1=26(y), r2=115(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 26
LDI r2, 115
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
