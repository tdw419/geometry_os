; DESCRIPTION: Places a purple 54x44 rectangle at position (92, 128).
; PLAN: r0=92(x), r1=128(y), r2=54(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 128
LDI r2, 54
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
