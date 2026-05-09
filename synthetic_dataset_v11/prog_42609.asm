; DESCRIPTION: Places a red 106x59 rectangle at position (104, 88).
; PLAN: r0=104(x), r1=88(y), r2=106(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 88
LDI r2, 106
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
