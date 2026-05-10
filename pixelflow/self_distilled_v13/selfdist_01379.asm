; DESCRIPTION: Creates a cyan filled rectangle of size 38x36 starting at (278, 51).
; PLAN: r0=278(x), r1=51(y), r2=38(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 51
LDI r2, 38
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
