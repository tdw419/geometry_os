; DESCRIPTION: Places a black 104x111 rectangle at position (199, 67).
; PLAN: r0=199(x), r1=67(y), r2=104(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 67
LDI r2, 104
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
