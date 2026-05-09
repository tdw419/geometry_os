; DESCRIPTION: Renders a cyan box of size 31x80 starting at (114, 169).
; PLAN: r0=114(x), r1=169(y), r2=31(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 169
LDI r2, 31
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
