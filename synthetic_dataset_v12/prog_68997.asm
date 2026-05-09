; DESCRIPTION: Places a red 104x71 rectangle at position (114, 138).
; PLAN: r0=114(x), r1=138(y), r2=104(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 138
LDI r2, 104
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
