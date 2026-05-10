; DESCRIPTION: Creates a cyan rectangular region at (356, 2) spanning 27 by 89 pixels.
; PLAN: r0=356(x), r1=2(y), r2=27(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 2
LDI r2, 27
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
