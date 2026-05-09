; DESCRIPTION: Renders a cyan box of size 28x110 starting at (70, 71).
; PLAN: r0=70(x), r1=71(y), r2=28(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 71
LDI r2, 28
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
