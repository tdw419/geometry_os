; DESCRIPTION: Renders a orange box of size 48x90 starting at (229, 90).
; PLAN: r0=229(x), r1=90(y), r2=48(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 90
LDI r2, 48
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
