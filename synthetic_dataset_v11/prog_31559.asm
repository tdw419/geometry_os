; DESCRIPTION: Renders a cyan box of size 64x77 starting at (78, 59).
; PLAN: r0=78(x), r1=59(y), r2=64(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 59
LDI r2, 64
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
