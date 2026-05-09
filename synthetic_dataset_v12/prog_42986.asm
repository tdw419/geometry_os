; DESCRIPTION: Draws a yellow rectangle at (308, 193) with width 10 and height 44.
; PLAN: r0=308(x), r1=193(y), r2=10(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 193
LDI r2, 10
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
