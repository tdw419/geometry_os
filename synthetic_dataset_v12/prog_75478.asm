; DESCRIPTION: Places a purple 55x113 rectangle at position (208, 57).
; PLAN: r0=208(x), r1=57(y), r2=55(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 57
LDI r2, 55
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
