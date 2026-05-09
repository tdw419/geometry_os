; DESCRIPTION: Renders a white box of size 48x77 starting at (261, 14).
; PLAN: r0=261(x), r1=14(y), r2=48(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 14
LDI r2, 48
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
