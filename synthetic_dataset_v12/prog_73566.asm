; DESCRIPTION: Renders a green box of size 99x120 starting at (321, 61).
; PLAN: r0=321(x), r1=61(y), r2=99(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 61
LDI r2, 99
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
