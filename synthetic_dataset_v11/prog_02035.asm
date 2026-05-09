; DESCRIPTION: Renders a orange box of size 20x30 starting at (112, 221).
; PLAN: r0=112(x), r1=221(y), r2=20(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 221
LDI r2, 20
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
