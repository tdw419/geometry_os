; DESCRIPTION: Renders a orange box of size 47x86 starting at (425, 86).
; PLAN: r0=425(x), r1=86(y), r2=47(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 86
LDI r2, 47
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
