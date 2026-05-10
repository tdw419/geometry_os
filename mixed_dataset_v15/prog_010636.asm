; DESCRIPTION: Renders a orange box of size 63x42 starting at (154, 188).
; PLAN: r0=154(x), r1=188(y), r2=63(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 188
LDI r2, 63
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
