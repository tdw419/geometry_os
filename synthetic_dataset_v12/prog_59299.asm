; DESCRIPTION: Renders a white box of size 70x23 starting at (307, 54).
; PLAN: r0=307(x), r1=54(y), r2=70(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 54
LDI r2, 70
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
