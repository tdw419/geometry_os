; DESCRIPTION: Places a purple 95x90 rectangle at position (45, 93).
; PLAN: r0=45(x), r1=93(y), r2=95(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 93
LDI r2, 95
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
