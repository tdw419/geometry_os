; DESCRIPTION: Renders a orange box of size 93x47 starting at (303, 99).
; PLAN: r0=303(x), r1=99(y), r2=93(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 99
LDI r2, 93
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
