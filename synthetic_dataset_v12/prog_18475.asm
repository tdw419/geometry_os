; DESCRIPTION: Places a yellow 20x52 rectangle at position (159, 134).
; PLAN: r0=159(x), r1=134(y), r2=20(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 134
LDI r2, 20
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
