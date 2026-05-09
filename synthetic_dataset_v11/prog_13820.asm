; DESCRIPTION: Renders a green box of size 47x84 starting at (199, 27).
; PLAN: r0=199(x), r1=27(y), r2=47(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 27
LDI r2, 47
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
