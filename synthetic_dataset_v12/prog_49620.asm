; DESCRIPTION: Renders a cyan box of size 21x88 starting at (281, 75).
; PLAN: r0=281(x), r1=75(y), r2=21(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 75
LDI r2, 21
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
