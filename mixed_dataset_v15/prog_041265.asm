; DESCRIPTION: Renders a orange box of size 21x109 starting at (133, 54).
; PLAN: r0=133(x), r1=54(y), r2=21(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 54
LDI r2, 21
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
