; DESCRIPTION: Renders a green box of size 31x99 starting at (259, 146).
; PLAN: r0=259(x), r1=146(y), r2=31(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 146
LDI r2, 31
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
