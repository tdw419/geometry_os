; DESCRIPTION: Renders a cyan box of size 35x77 starting at (48, 54).
; PLAN: r0=48(x), r1=54(y), r2=35(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 54
LDI r2, 35
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
