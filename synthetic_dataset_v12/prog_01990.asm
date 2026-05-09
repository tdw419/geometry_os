; DESCRIPTION: Creates a yellow rectangular region at (209, 133) spanning 42 by 54 pixels.
; PLAN: r0=209(x), r1=133(y), r2=42(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 133
LDI r2, 42
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
