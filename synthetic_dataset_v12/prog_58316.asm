; DESCRIPTION: Renders a orange box of size 16x25 starting at (175, 4).
; PLAN: r0=175(x), r1=4(y), r2=16(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 4
LDI r2, 16
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
