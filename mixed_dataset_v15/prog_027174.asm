; DESCRIPTION: Renders a blue rectangular region spanning 59 by 42 at (312, 32).
; PLAN: r0=312(x), r1=32(y), r2=59(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 32
LDI r2, 59
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
