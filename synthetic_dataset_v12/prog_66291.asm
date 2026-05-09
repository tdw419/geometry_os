; DESCRIPTION: Places a purple 92x113 rectangle at position (102, 0).
; PLAN: r0=102(x), r1=0(y), r2=92(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 0
LDI r2, 92
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
