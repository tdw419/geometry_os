; DESCRIPTION: Places a blue 86x100 rectangle at position (308, 143).
; PLAN: r0=308(x), r1=143(y), r2=86(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 143
LDI r2, 86
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
