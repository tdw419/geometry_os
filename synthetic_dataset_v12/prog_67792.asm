; DESCRIPTION: Renders a orange box of size 40x94 starting at (255, 27).
; PLAN: r0=255(x), r1=27(y), r2=40(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 27
LDI r2, 40
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
