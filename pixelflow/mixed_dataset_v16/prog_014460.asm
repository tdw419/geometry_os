; DESCRIPTION: Places a red 58x111 rectangle at position (262, 104).
; PLAN: r0=262(x), r1=104(y), r2=58(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 104
LDI r2, 58
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
