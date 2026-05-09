; DESCRIPTION: Renders a green box of size 31x48 starting at (182, 150).
; PLAN: r0=182(x), r1=150(y), r2=31(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 150
LDI r2, 31
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
