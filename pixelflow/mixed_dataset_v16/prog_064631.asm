; DESCRIPTION: Renders a cyan box of size 39x77 starting at (276, 33).
; PLAN: r0=276(x), r1=33(y), r2=39(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 33
LDI r2, 39
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
