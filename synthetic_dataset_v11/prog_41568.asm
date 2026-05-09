; DESCRIPTION: Renders a orange box of size 42x86 starting at (85, 67).
; PLAN: r0=85(x), r1=67(y), r2=42(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 67
LDI r2, 42
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
