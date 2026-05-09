; DESCRIPTION: Renders a orange box of size 109x21 starting at (256, 89).
; PLAN: r0=256(x), r1=89(y), r2=109(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 89
LDI r2, 109
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
