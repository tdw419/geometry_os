; DESCRIPTION: Renders a orange box of size 54x38 starting at (239, 120).
; PLAN: r0=239(x), r1=120(y), r2=54(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 120
LDI r2, 54
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
