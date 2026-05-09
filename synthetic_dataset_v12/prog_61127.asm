; DESCRIPTION: Renders a red box of size 66x49 starting at (127, 86).
; PLAN: r0=127(x), r1=86(y), r2=66(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 86
LDI r2, 66
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
