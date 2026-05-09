; DESCRIPTION: Renders a orange box of size 86x61 starting at (121, 154).
; PLAN: r0=121(x), r1=154(y), r2=86(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 154
LDI r2, 86
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
