; DESCRIPTION: Places a white 120x35 rectangle at position (98, 149).
; PLAN: r0=98(x), r1=149(y), r2=120(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 149
LDI r2, 120
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
