; DESCRIPTION: Renders a cyan box of size 78x60 starting at (20, 46).
; PLAN: r0=20(x), r1=46(y), r2=78(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 46
LDI r2, 78
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
