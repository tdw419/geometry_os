; DESCRIPTION: Renders a magenta box of size 41x82 starting at (390, 42).
; PLAN: r0=390(x), r1=42(y), r2=41(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 42
LDI r2, 41
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
