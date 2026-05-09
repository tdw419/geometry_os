; DESCRIPTION: Places a purple 111x86 rectangle at position (291, 36).
; PLAN: r0=291(x), r1=36(y), r2=111(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 36
LDI r2, 111
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
