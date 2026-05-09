; DESCRIPTION: Places a red 69x111 rectangle at position (18, 77).
; PLAN: r0=18(x), r1=77(y), r2=69(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 77
LDI r2, 69
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
