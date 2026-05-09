; DESCRIPTION: Renders a cyan box of size 25x60 starting at (102, 70).
; PLAN: r0=102(x), r1=70(y), r2=25(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 70
LDI r2, 25
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
