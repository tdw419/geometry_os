; DESCRIPTION: Renders a orange box of size 16x36 starting at (194, 208).
; PLAN: r0=194(x), r1=208(y), r2=16(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 208
LDI r2, 16
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
