; DESCRIPTION: Renders a green box of size 18x27 starting at (283, 169).
; PLAN: r0=283(x), r1=169(y), r2=18(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 169
LDI r2, 18
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
