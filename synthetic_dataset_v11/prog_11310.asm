; DESCRIPTION: Places a white 65x37 rectangle at position (122, 29).
; PLAN: r0=122(x), r1=29(y), r2=65(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 29
LDI r2, 65
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
