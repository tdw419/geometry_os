; DESCRIPTION: Places a purple 31x48 rectangle at position (39, 78).
; PLAN: r0=39(x), r1=78(y), r2=31(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 78
LDI r2, 31
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
