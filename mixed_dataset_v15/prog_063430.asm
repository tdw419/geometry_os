; DESCRIPTION: Draws a white rectangle at (400, 191) with width 27 and height 46.
; PLAN: r0=400(x), r1=191(y), r2=27(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 191
LDI r2, 27
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
