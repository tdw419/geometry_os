; DESCRIPTION: Renders a white box of size 99x68 starting at (216, 113).
; PLAN: r0=216(x), r1=113(y), r2=99(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 113
LDI r2, 99
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
