; DESCRIPTION: Places a purple 15x113 rectangle at position (182, 9).
; PLAN: r0=182(x), r1=9(y), r2=15(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 9
LDI r2, 15
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
