; DESCRIPTION: Renders a cyan box of size 34x25 starting at (125, 13).
; PLAN: r0=125(x), r1=13(y), r2=34(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 13
LDI r2, 34
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
