; DESCRIPTION: Renders a cyan box of size 28x99 starting at (44, 32).
; PLAN: r0=44(x), r1=32(y), r2=28(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 32
LDI r2, 28
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
