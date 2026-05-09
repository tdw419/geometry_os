; DESCRIPTION: Renders a yellow box of size 12x77 starting at (284, 81).
; PLAN: r0=284(x), r1=81(y), r2=12(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 81
LDI r2, 12
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
