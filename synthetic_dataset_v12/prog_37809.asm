; DESCRIPTION: Places a white 49x83 rectangle at position (98, 29).
; PLAN: r0=98(x), r1=29(y), r2=49(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 29
LDI r2, 49
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
