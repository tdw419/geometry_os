; DESCRIPTION: Renders a orange box of size 90x64 starting at (190, 39).
; PLAN: r0=190(x), r1=39(y), r2=90(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 39
LDI r2, 90
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
