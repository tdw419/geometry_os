; DESCRIPTION: Places a white 25x47 rectangle at position (124, 70).
; PLAN: r0=124(x), r1=70(y), r2=25(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 70
LDI r2, 25
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
