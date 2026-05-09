; DESCRIPTION: Places a purple 82x113 rectangle at position (78, 87).
; PLAN: r0=78(x), r1=87(y), r2=82(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 87
LDI r2, 82
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
