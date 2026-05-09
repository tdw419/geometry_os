; DESCRIPTION: Renders a cyan box of size 48x70 starting at (49, 13).
; PLAN: r0=49(x), r1=13(y), r2=48(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 13
LDI r2, 48
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
