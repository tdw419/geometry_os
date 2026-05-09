; DESCRIPTION: Renders a orange box of size 15x66 starting at (238, 93).
; PLAN: r0=238(x), r1=93(y), r2=15(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 93
LDI r2, 15
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
