; DESCRIPTION: Renders a orange box of size 43x98 starting at (262, 152).
; PLAN: r0=262(x), r1=152(y), r2=43(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 152
LDI r2, 43
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
