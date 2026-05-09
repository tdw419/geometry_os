; DESCRIPTION: Renders a yellow box of size 87x77 starting at (122, 103).
; PLAN: r0=122(x), r1=103(y), r2=87(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 103
LDI r2, 87
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
