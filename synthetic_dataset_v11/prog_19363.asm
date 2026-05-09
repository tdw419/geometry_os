; DESCRIPTION: Places a purple 59x95 rectangle at position (120, 60).
; PLAN: r0=120(x), r1=60(y), r2=59(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 60
LDI r2, 59
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
