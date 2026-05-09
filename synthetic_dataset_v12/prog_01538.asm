; DESCRIPTION: Places a purple 13x50 rectangle at position (460, 153).
; PLAN: r0=460(x), r1=153(y), r2=13(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 153
LDI r2, 13
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
