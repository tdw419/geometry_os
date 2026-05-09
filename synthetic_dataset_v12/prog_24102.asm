; DESCRIPTION: Renders a orange box of size 54x48 starting at (349, 183).
; PLAN: r0=349(x), r1=183(y), r2=54(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 183
LDI r2, 54
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
