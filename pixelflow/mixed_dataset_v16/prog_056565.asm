; DESCRIPTION: Renders a orange box of size 46x45 starting at (126, 52).
; PLAN: r0=126(x), r1=52(y), r2=46(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 52
LDI r2, 46
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
