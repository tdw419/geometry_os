; DESCRIPTION: Places a white 69x94 rectangle at position (69, 113).
; PLAN: r0=69(x), r1=113(y), r2=69(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 113
LDI r2, 69
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
