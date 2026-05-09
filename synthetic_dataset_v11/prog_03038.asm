; DESCRIPTION: Renders a green box of size 109x21 starting at (68, 113).
; PLAN: r0=68(x), r1=113(y), r2=109(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 113
LDI r2, 109
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
