; DESCRIPTION: Places a purple 104x111 rectangle at position (60, 27).
; PLAN: r0=60(x), r1=27(y), r2=104(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 27
LDI r2, 104
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
