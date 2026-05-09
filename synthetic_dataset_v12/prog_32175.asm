; DESCRIPTION: Renders a magenta box of size 80x18 starting at (218, 54).
; PLAN: r0=218(x), r1=54(y), r2=80(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 54
LDI r2, 80
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
