; DESCRIPTION: Places a purple 48x52 rectangle at position (103, 95).
; PLAN: r0=103(x), r1=95(y), r2=48(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 95
LDI r2, 48
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
