; DESCRIPTION: Renders a orange box of size 82x118 starting at (42, 54).
; PLAN: r0=42(x), r1=54(y), r2=82(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 54
LDI r2, 82
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
