; DESCRIPTION: Renders a cyan box of size 80x30 starting at (205, 199).
; PLAN: r0=205(x), r1=199(y), r2=80(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 199
LDI r2, 80
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
