; DESCRIPTION: Places a white 29x47 rectangle at position (266, 107).
; PLAN: r0=266(x), r1=107(y), r2=29(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 107
LDI r2, 29
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
