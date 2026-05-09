; DESCRIPTION: Creates a yellow rectangular region at (356, 42) spanning 87 by 10 pixels.
; PLAN: r0=356(x), r1=42(y), r2=87(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 42
LDI r2, 87
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
