; DESCRIPTION: Renders a orange box of size 94x61 starting at (178, 153).
; PLAN: r0=178(x), r1=153(y), r2=94(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 153
LDI r2, 94
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
