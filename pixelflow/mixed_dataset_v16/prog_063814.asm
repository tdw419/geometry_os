; DESCRIPTION: Places a green 69x69 rectangle at position (199, 112).
; PLAN: r0=199(x), r1=112(y), r2=69(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 112
LDI r2, 69
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
