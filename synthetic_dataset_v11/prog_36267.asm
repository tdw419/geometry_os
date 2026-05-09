; DESCRIPTION: Renders a cyan box of size 106x35 starting at (28, 133).
; PLAN: r0=28(x), r1=133(y), r2=106(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 133
LDI r2, 106
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
