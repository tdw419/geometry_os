; DESCRIPTION: Renders a cyan box of size 33x62 starting at (309, 124).
; PLAN: r0=309(x), r1=124(y), r2=33(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 124
LDI r2, 33
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
