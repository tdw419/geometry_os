; DESCRIPTION: Renders a orange box of size 97x113 starting at (272, 37).
; PLAN: r0=272(x), r1=37(y), r2=97(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 37
LDI r2, 97
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
