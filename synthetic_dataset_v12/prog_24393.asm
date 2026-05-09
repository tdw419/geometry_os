; DESCRIPTION: Renders a cyan box of size 39x89 starting at (211, 46).
; PLAN: r0=211(x), r1=46(y), r2=39(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 46
LDI r2, 39
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
