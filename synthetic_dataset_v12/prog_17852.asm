; DESCRIPTION: Places a magenta 96x52 rectangle at position (363, 42).
; PLAN: r0=363(x), r1=42(y), r2=96(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 42
LDI r2, 96
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
