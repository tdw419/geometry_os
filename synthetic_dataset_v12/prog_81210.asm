; DESCRIPTION: Places a purple 19x92 rectangle at position (242, 86).
; PLAN: r0=242(x), r1=86(y), r2=19(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 86
LDI r2, 19
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
