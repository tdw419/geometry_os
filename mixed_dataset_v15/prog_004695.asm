; DESCRIPTION: Creates a yellow rectangular region at (377, 173) spanning 48 by 42 pixels.
; PLAN: r0=377(x), r1=173(y), r2=48(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 173
LDI r2, 48
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
