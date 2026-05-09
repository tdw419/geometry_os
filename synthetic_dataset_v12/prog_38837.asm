; DESCRIPTION: Renders a green box of size 20x72 starting at (405, 92).
; PLAN: r0=405(x), r1=92(y), r2=20(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 92
LDI r2, 20
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
