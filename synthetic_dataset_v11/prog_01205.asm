; DESCRIPTION: Renders a green box of size 85x44 starting at (59, 120).
; PLAN: r0=59(x), r1=120(y), r2=85(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 120
LDI r2, 85
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
