; DESCRIPTION: Places a purple 116x33 rectangle at position (18, 209).
; PLAN: r0=18(x), r1=209(y), r2=116(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 209
LDI r2, 116
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
