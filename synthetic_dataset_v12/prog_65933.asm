; DESCRIPTION: Renders a orange box of size 112x45 starting at (79, 144).
; PLAN: r0=79(x), r1=144(y), r2=112(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 144
LDI r2, 112
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
