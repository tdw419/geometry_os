; DESCRIPTION: Renders a orange box of size 47x22 starting at (382, 231).
; PLAN: r0=382(x), r1=231(y), r2=47(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 231
LDI r2, 47
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
