; DESCRIPTION: Places a white 55x62 rectangle at position (19, 113).
; PLAN: r0=19(x), r1=113(y), r2=55(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 113
LDI r2, 55
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
