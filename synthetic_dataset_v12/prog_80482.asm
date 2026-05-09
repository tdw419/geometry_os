; DESCRIPTION: Creates a yellow rectangular region at (395, 59) spanning 42 by 64 pixels.
; PLAN: r0=395(x), r1=59(y), r2=42(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 59
LDI r2, 42
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
