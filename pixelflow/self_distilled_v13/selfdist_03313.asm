; DESCRIPTION: Renders a purple rectangular region spanning 52 by 42 at (95, 92).
; PLAN: r0=95(x), r1=92(y), r2=52(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 92
LDI r2, 52
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
