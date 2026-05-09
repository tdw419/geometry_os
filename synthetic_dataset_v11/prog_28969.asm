; DESCRIPTION: Renders a green box of size 52x39 starting at (25, 117).
; PLAN: r0=25(x), r1=117(y), r2=52(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 117
LDI r2, 52
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
