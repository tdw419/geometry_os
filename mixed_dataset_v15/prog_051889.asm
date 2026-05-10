; DESCRIPTION: Renders a orange box of size 85x42 starting at (411, 65).
; PLAN: r0=411(x), r1=65(y), r2=85(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 65
LDI r2, 85
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
