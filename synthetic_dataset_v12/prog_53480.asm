; DESCRIPTION: Renders a yellow box of size 18x80 starting at (50, 61).
; PLAN: r0=50(x), r1=61(y), r2=18(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 61
LDI r2, 18
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
