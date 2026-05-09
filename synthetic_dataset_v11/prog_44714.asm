; DESCRIPTION: Renders a green box of size 47x50 starting at (5, 165).
; PLAN: r0=5(x), r1=165(y), r2=47(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 165
LDI r2, 47
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
