; DESCRIPTION: Renders a cyan box of size 94x46 starting at (12, 124).
; PLAN: r0=12(x), r1=124(y), r2=94(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 124
LDI r2, 94
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
