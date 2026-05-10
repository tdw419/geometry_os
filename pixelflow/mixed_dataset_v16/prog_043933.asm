; DESCRIPTION: Renders a orange box of size 118x94 starting at (301, 27).
; PLAN: r0=301(x), r1=27(y), r2=118(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 27
LDI r2, 118
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
