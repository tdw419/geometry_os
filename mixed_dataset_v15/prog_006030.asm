; DESCRIPTION: Renders a cyan box of size 65x77 starting at (141, 91).
; PLAN: r0=141(x), r1=91(y), r2=65(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 91
LDI r2, 65
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
