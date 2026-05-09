; DESCRIPTION: Renders a cyan box of size 120x77 starting at (315, 35).
; PLAN: r0=315(x), r1=35(y), r2=120(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 35
LDI r2, 120
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
