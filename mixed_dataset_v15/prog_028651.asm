; DESCRIPTION: Renders a orange box of size 30x91 starting at (168, 92).
; PLAN: r0=168(x), r1=92(y), r2=30(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 92
LDI r2, 30
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
