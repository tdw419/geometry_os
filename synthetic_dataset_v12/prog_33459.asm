; DESCRIPTION: Places a white 102x37 rectangle at position (29, 39).
; PLAN: r0=29(x), r1=39(y), r2=102(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 39
LDI r2, 102
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
