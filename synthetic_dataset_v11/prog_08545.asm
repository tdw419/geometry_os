; DESCRIPTION: Creates a red rectangular region at (42, 150) spanning 84 by 58 pixels.
; PLAN: r0=42(x), r1=150(y), r2=84(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 150
LDI r2, 84
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
