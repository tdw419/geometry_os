; DESCRIPTION: Renders a orange box of size 42x116 starting at (63, 85).
; PLAN: r0=63(x), r1=85(y), r2=42(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 85
LDI r2, 42
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
