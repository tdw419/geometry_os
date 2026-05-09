; DESCRIPTION: Renders a cyan box of size 106x75 starting at (33, 119).
; PLAN: r0=33(x), r1=119(y), r2=106(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 119
LDI r2, 106
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
