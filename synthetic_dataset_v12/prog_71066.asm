; DESCRIPTION: Renders a orange box of size 68x92 starting at (133, 164).
; PLAN: r0=133(x), r1=164(y), r2=68(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 164
LDI r2, 68
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
