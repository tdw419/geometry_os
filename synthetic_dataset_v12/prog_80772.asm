; DESCRIPTION: Renders a orange box of size 27x34 starting at (242, 97).
; PLAN: r0=242(x), r1=97(y), r2=27(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 97
LDI r2, 27
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
