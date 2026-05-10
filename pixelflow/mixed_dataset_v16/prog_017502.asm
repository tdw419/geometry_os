; DESCRIPTION: Renders a orange box of size 93x23 starting at (145, 207).
; PLAN: r0=145(x), r1=207(y), r2=93(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 207
LDI r2, 93
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
