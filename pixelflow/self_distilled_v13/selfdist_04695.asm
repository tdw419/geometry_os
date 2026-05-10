; DESCRIPTION: Renders a orange rectangular region spanning 109 by 16 at (157, 162).
; PLAN: r0=157(x), r1=162(y), r2=109(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 162
LDI r2, 109
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
