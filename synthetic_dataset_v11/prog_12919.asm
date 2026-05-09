; DESCRIPTION: Places a orange 94x42 rectangle at position (92, 194).
; PLAN: r0=92(x), r1=194(y), r2=94(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 194
LDI r2, 94
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
