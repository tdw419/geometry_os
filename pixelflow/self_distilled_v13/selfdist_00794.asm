; DESCRIPTION: Renders a yellow rectangular region spanning 106 by 59 at (128, 42).
; PLAN: r0=128(x), r1=42(y), r2=106(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 42
LDI r2, 106
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
