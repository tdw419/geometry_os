; DESCRIPTION: Renders a cyan box of size 70x75 starting at (210, 49).
; PLAN: r0=210(x), r1=49(y), r2=70(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 49
LDI r2, 70
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
