; DESCRIPTION: Renders a orange box of size 91x87 starting at (21, 154).
; PLAN: r0=21(x), r1=154(y), r2=91(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 154
LDI r2, 91
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
