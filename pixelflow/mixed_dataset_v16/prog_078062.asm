; DESCRIPTION: Renders a orange box of size 45x46 starting at (263, 169).
; PLAN: r0=263(x), r1=169(y), r2=45(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 169
LDI r2, 45
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
