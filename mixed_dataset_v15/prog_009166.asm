; DESCRIPTION: Renders a cyan box of size 20x77 starting at (450, 40).
; PLAN: r0=450(x), r1=40(y), r2=20(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 40
LDI r2, 20
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
