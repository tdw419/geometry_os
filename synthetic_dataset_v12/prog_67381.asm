; DESCRIPTION: Renders a cyan box of size 32x44 starting at (30, 205).
; PLAN: r0=30(x), r1=205(y), r2=32(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 205
LDI r2, 32
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
