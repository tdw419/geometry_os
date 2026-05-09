; DESCRIPTION: Renders a cyan box of size 91x77 starting at (251, 121).
; PLAN: r0=251(x), r1=121(y), r2=91(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 121
LDI r2, 91
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
