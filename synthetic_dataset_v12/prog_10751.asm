; DESCRIPTION: Renders a orange box of size 64x99 starting at (67, 143).
; PLAN: r0=67(x), r1=143(y), r2=64(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 143
LDI r2, 64
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
