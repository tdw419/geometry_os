; DESCRIPTION: Places a purple 27x96 rectangle at position (214, 114).
; PLAN: r0=214(x), r1=114(y), r2=27(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 114
LDI r2, 27
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
