; DESCRIPTION: Places a purple 92x99 rectangle at position (284, 156).
; PLAN: r0=284(x), r1=156(y), r2=92(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 156
LDI r2, 92
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
