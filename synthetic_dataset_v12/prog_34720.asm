; DESCRIPTION: Renders a orange box of size 93x27 starting at (95, 138).
; PLAN: r0=95(x), r1=138(y), r2=93(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 138
LDI r2, 93
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
