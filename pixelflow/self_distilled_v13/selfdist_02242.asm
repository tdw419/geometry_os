; DESCRIPTION: Renders a orange rectangular region spanning 86 by 42 at (216, 5).
; PLAN: r0=216(x), r1=5(y), r2=86(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 5
LDI r2, 86
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
