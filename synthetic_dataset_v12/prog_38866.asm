; DESCRIPTION: Places a magenta 96x30 rectangle at position (363, 18).
; PLAN: r0=363(x), r1=18(y), r2=96(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 18
LDI r2, 96
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
