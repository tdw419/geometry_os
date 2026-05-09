; DESCRIPTION: Renders a orange box of size 48x32 starting at (188, 46).
; PLAN: r0=188(x), r1=46(y), r2=48(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 46
LDI r2, 48
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
