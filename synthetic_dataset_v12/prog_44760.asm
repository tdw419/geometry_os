; DESCRIPTION: Renders a green box of size 92x92 starting at (174, 83).
; PLAN: r0=174(x), r1=83(y), r2=92(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 83
LDI r2, 92
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
