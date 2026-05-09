; DESCRIPTION: Renders a cyan box of size 87x80 starting at (102, 9).
; PLAN: r0=102(x), r1=9(y), r2=87(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 9
LDI r2, 87
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
