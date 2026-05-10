; DESCRIPTION: Renders a orange box of size 48x60 starting at (374, 175).
; PLAN: r0=374(x), r1=175(y), r2=48(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 175
LDI r2, 48
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
