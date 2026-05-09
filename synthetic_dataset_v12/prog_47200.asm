; DESCRIPTION: Renders a orange box of size 37x26 starting at (243, 128).
; PLAN: r0=243(x), r1=128(y), r2=37(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 128
LDI r2, 37
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
