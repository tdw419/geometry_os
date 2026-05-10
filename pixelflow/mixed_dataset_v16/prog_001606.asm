; DESCRIPTION: Places a purple 120x100 rectangle at position (228, 93).
; PLAN: r0=228(x), r1=93(y), r2=120(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 93
LDI r2, 120
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
