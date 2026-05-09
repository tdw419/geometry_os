; DESCRIPTION: Places a blue 12x90 rectangle at position (145, 42).
; PLAN: r0=145(x), r1=42(y), r2=12(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 42
LDI r2, 12
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
