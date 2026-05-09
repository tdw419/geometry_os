; DESCRIPTION: Places a purple 111x86 rectangle at position (151, 78).
; PLAN: r0=151(x), r1=78(y), r2=111(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 78
LDI r2, 111
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
