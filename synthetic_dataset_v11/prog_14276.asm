; DESCRIPTION: Places a white 113x117 rectangle at position (29, 78).
; PLAN: r0=29(x), r1=78(y), r2=113(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 78
LDI r2, 113
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
