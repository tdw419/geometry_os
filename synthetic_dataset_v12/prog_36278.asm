; DESCRIPTION: Renders a green box of size 58x92 starting at (218, 71).
; PLAN: r0=218(x), r1=71(y), r2=58(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 71
LDI r2, 58
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
