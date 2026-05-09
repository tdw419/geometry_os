; DESCRIPTION: Renders a green box of size 57x54 starting at (280, 28).
; PLAN: r0=280(x), r1=28(y), r2=57(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 28
LDI r2, 57
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
