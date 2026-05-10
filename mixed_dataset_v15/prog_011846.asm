; DESCRIPTION: Renders a yellow rectangular region spanning 27 by 120 at (371, 91).
; PLAN: r0=371(x), r1=91(y), r2=27(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 91
LDI r2, 27
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
