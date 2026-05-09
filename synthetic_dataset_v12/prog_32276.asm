; DESCRIPTION: Renders a cyan box of size 85x19 starting at (171, 192).
; PLAN: r0=171(x), r1=192(y), r2=85(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 192
LDI r2, 85
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
