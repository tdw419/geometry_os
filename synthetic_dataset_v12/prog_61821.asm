; DESCRIPTION: Renders a orange box of size 26x66 starting at (392, 71).
; PLAN: r0=392(x), r1=71(y), r2=26(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 71
LDI r2, 26
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
