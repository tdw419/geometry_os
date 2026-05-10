; DESCRIPTION: Renders a orange box of size 65x86 starting at (353, 54).
; PLAN: r0=353(x), r1=54(y), r2=65(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 54
LDI r2, 65
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
