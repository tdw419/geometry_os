; DESCRIPTION: Renders a cyan box of size 77x44 starting at (323, 12).
; PLAN: r0=323(x), r1=12(y), r2=77(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 12
LDI r2, 77
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
