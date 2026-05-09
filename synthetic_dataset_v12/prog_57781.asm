; DESCRIPTION: Composite: Places a magenta 67x41 rectangle at position (283, 54) then Renders a orange disk with center (77, 87) and radius 68.
; PLAN: r0=283(x), r1=54(y), r2=67(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=87(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 283
LDI r1, 54
LDI r2, 67
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 87
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
