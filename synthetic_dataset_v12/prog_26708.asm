; DESCRIPTION: Renders a orange box of size 71x63 starting at (294, 81).
; PLAN: r0=294(x), r1=81(y), r2=71(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 81
LDI r2, 71
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
