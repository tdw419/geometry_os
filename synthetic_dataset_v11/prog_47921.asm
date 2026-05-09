; DESCRIPTION: Creates a red rectangular region at (42, 59) spanning 87 by 17 pixels.
; PLAN: r0=42(x), r1=59(y), r2=87(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 59
LDI r2, 87
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
