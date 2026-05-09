; DESCRIPTION: Renders a orange box of size 99x94 starting at (220, 113).
; PLAN: r0=220(x), r1=113(y), r2=99(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 113
LDI r2, 99
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
