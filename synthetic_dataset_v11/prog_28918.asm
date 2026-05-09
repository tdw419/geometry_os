; DESCRIPTION: Renders a cyan box of size 28x84 starting at (13, 46).
; PLAN: r0=13(x), r1=46(y), r2=28(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 46
LDI r2, 28
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
