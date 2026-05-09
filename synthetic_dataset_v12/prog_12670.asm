; DESCRIPTION: Renders a orange box of size 75x22 starting at (406, 207).
; PLAN: r0=406(x), r1=207(y), r2=75(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 207
LDI r2, 75
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
