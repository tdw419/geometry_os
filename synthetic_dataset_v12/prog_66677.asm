; DESCRIPTION: Places a purple 21x86 rectangle at position (435, 31).
; PLAN: r0=435(x), r1=31(y), r2=21(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 31
LDI r2, 21
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
