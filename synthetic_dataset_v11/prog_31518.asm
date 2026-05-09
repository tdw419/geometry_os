; DESCRIPTION: Renders a cyan box of size 83x46 starting at (151, 91).
; PLAN: r0=151(x), r1=91(y), r2=83(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 91
LDI r2, 83
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
