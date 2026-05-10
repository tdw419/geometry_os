; DESCRIPTION: Renders a orange box of size 38x54 starting at (209, 31).
; PLAN: r0=209(x), r1=31(y), r2=38(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 31
LDI r2, 38
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
