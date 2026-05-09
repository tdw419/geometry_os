; DESCRIPTION: Renders a cyan box of size 24x98 starting at (28, 33).
; PLAN: r0=28(x), r1=33(y), r2=24(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 33
LDI r2, 24
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
