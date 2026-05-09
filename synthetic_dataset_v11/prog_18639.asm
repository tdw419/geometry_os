; DESCRIPTION: Renders a cyan box of size 28x80 starting at (9, 84).
; PLAN: r0=9(x), r1=84(y), r2=28(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 84
LDI r2, 28
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
