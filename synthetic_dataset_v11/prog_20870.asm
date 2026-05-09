; DESCRIPTION: Renders a green box of size 40x27 starting at (92, 186).
; PLAN: r0=92(x), r1=186(y), r2=40(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 186
LDI r2, 40
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
