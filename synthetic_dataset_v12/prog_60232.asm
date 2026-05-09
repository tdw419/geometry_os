; DESCRIPTION: Renders a orange box of size 38x54 starting at (296, 112).
; PLAN: r0=296(x), r1=112(y), r2=38(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 112
LDI r2, 38
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
