; DESCRIPTION: Renders a orange box of size 93x68 starting at (342, 64).
; PLAN: r0=342(x), r1=64(y), r2=93(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 64
LDI r2, 93
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
