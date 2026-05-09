; DESCRIPTION: Renders a orange box of size 63x54 starting at (186, 74).
; PLAN: r0=186(x), r1=74(y), r2=63(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 74
LDI r2, 63
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
