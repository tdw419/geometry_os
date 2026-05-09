; DESCRIPTION: Places a white 29x109 rectangle at position (359, 47).
; PLAN: r0=359(x), r1=47(y), r2=29(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 47
LDI r2, 29
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
