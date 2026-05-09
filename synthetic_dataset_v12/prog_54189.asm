; DESCRIPTION: Creates a purple rectangular region at (42, 26) spanning 48 by 61 pixels.
; PLAN: r0=42(x), r1=26(y), r2=48(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 26
LDI r2, 48
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
