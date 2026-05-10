; DESCRIPTION: Renders a orange box of size 98x57 starting at (372, 196).
; PLAN: r0=372(x), r1=196(y), r2=98(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 196
LDI r2, 98
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
