; DESCRIPTION: Places a purple 92x17 rectangle at position (66, 214).
; PLAN: r0=66(x), r1=214(y), r2=92(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 214
LDI r2, 92
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
