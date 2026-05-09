; DESCRIPTION: Renders a cyan box of size 71x73 starting at (18, 28).
; PLAN: r0=18(x), r1=28(y), r2=71(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 28
LDI r2, 71
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
