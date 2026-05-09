; DESCRIPTION: Renders a cyan box of size 15x113 starting at (435, 34).
; PLAN: r0=435(x), r1=34(y), r2=15(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 34
LDI r2, 15
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
