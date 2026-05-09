; DESCRIPTION: Renders a orange box of size 27x46 starting at (209, 50).
; PLAN: r0=209(x), r1=50(y), r2=27(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 50
LDI r2, 27
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
