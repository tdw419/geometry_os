; DESCRIPTION: Places a purple 120x83 rectangle at position (45, 57).
; PLAN: r0=45(x), r1=57(y), r2=120(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 57
LDI r2, 120
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
