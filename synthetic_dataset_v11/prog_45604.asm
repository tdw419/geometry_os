; DESCRIPTION: Renders a orange box of size 46x18 starting at (63, 146).
; PLAN: r0=63(x), r1=146(y), r2=46(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 146
LDI r2, 46
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
