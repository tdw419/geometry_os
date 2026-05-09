; DESCRIPTION: Places a white 15x111 rectangle at position (38, 81).
; PLAN: r0=38(x), r1=81(y), r2=15(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 81
LDI r2, 15
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
