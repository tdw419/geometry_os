; DESCRIPTION: Renders a blue rectangular region spanning 42 by 109 at (150, 68).
; PLAN: r0=150(x), r1=68(y), r2=42(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 68
LDI r2, 42
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
