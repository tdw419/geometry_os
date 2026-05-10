; DESCRIPTION: Places a blue 104x111 rectangle at position (352, 15).
; PLAN: r0=352(x), r1=15(y), r2=104(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 15
LDI r2, 104
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
