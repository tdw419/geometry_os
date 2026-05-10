; DESCRIPTION: Places a white 71x117 rectangle at position (138, 70).
; PLAN: r0=138(x), r1=70(y), r2=71(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 70
LDI r2, 71
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
