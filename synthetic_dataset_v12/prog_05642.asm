; DESCRIPTION: Renders a orange box of size 52x93 starting at (23, 143).
; PLAN: r0=23(x), r1=143(y), r2=52(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 143
LDI r2, 52
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
