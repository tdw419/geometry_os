; DESCRIPTION: Renders a yellow box of size 80x77 starting at (210, 174).
; PLAN: r0=210(x), r1=174(y), r2=80(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 174
LDI r2, 80
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
